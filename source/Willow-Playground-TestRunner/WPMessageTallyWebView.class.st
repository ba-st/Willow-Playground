"
I'm a web view showing a message tally result
"
Class {
	#name : #WPMessageTallyWebView,
	#superclass : #WAPainter,
	#instVars : [
		'rootTally'
	],
	#category : #'Willow-Playground-TestRunner-WebViews'
}

{ #category : #'instance creation' }
WPMessageTallyWebView class >> for: aMessageTally [

	^ self new initializeFor: aMessageTally
]

{ #category : #rendering }
WPMessageTallyWebView >> formattedPercentagFor: node [

	^ (GRNumberPrinter new
		precision: 2;
		yourself) , '%' print: (self percentageFor: node) value
]

{ #category : #private }
WPMessageTallyWebView >> headingRendering: aRenderable [

	^ HeadingWebView displaying: aRenderable withLevel: 4 applying: [ :heading | heading addClass bootstrap textInfo ]
]

{ #category : #initialization }
WPMessageTallyWebView >> initializeFor: aMessageTally [

	rootTally := aMessageTally
]

{ #category : #rendering }
WPMessageTallyWebView >> itemRenderingCommandFor: node [

	^ [ :canvas | 
	canvas
		render: (PhrasingContainerWebView wrapping: (self formattedPercentagFor: node) applying: [ :label | label addClass bootstrap label + label addClass bootstrap labelPrimary ]);
		space;
		render:
			(PhrasingContainerWebView
				wrapping: [ :span | 
					span
						render: (self timeFor: node);
						space;
						render: 'ms' ]
				applying: [ :label | label addClass bootstrap label + label addClass bootstrap labelDefault ]);
		space;
		render: node method methodClass;
		space;
		render: '>>';
		space;
		render: node method selector;
		render: (self unorderedListRendering: node receivers) ]
]

{ #category : #rendering }
WPMessageTallyWebView >> percentageFor: node [

	^ Percentage ratio: (node tally / rootTally tally) 
]

{ #category : #rendering }
WPMessageTallyWebView >> renderBoundedContainerWrapping: aRenderable on: html upTo: aMaxHeight [

	html
		render:
			(GenericContainerWebView
				wrapping: aRenderable
				applying: [ :div :constants | 
					(div
						setStyleTo: [ :style | 
							style
								maxHeight: aMaxHeight;
								overflowY: constants css scroll ]) + div addClass bootstrap small ])
]

{ #category : #rendering }
WPMessageTallyWebView >> renderContentOn: html [

	self
		renderTreeOn: html;
		renderLeavesOn: html
]

{ #category : #rendering }
WPMessageTallyWebView >> renderLeavesOn: html [

	| leavesTable |

	html render: (self headingRendering: 'Leaves').

	leavesTable := self componentSupplier tableBuilder
		addColumnTitled: 'Percent'
			rendering: [ :node | self formattedPercentagFor: node ]
			applyingToCells: [ :cell | cell addClass bootstrap textRight ]
			applyingToHeading: [  ];
		addColumnTitled: 'Time (ms)'
			rendering: [ :node | self timeFor: node ]
			applyingToCells: [ :cell | cell addClass bootstrap textRight ]
			applyingToHeading: [  ];
		addColumnTitled: 'Class' rendering: [ :node | [ :canvas | canvas strong: node method methodClass ] ];
		addColumnTitled: 'Selector' rendering: [ :node | node method selector ];
		build.

	leavesTable changeContentsTo: self tallyLeavesSorted.

	self renderBoundedContainerWrapping: leavesTable on: html upTo: 20 vh
]

{ #category : #rendering }
WPMessageTallyWebView >> renderTreeOn: html [

	html render: (self headingRendering: 'Tree').
	self renderBoundedContainerWrapping: (self unorderedListRendering: rootTally receivers) on: html upTo: 40 vh
]

{ #category : #private }
WPMessageTallyWebView >> tallyLeavesSorted [

	| dict |

	dict := IdentityDictionary new: 100.
	rootTally leavesInto: dict fromSender: nil.
	^ dict asSortedCollection
]

{ #category : #rendering }
WPMessageTallyWebView >> timeFor: node [

	^ ((self percentageFor: node) * rootTally time) rounded
]

{ #category : #rendering }
WPMessageTallyWebView >> unorderedListRendering: tallies [

	^ (tallies isNil or: [ tallies isEmpty ])
		ifTrue: [ [  ] ]
		ifFalse: [ self componentSupplier
				unorderedListApplying: [ :list | 
					(list labelItemsWith: [ :node | self itemRenderingCommandFor: node ])
						+
							(list
								setStyleTo: [ :style | 
									style
										marginBottom: 0;
										paddingTop: 3 px ]) ]
				listing: tallies
				applyingToEach: [ :listItem | 
					listItem
						setStyleTo: [ :style | 
							style
								borderTop: 0;
								borderBottom: 0;
								borderRight: 0;
								paddingBottom: 0 ] ] ]
]
