"
I'm a web view showing a message tally result
"
Class {
	#name : #WPB3MessageTallyWebView,
	#superclass : #WAPainter,
	#instVars : [
		'rootTally'
	],
	#category : #'Willow-Playground-TestRunner-WebViews-Bootstrap-3'
}

{ #category : #'instance creation' }
WPB3MessageTallyWebView class >> for: aMessageTally [

	^ self new initializeFor: aMessageTally
]

{ #category : #rendering }
WPB3MessageTallyWebView >> formattedPercentagFor: node [

	^ (GRNumberPrinter new
		precision: 2;
		yourself) , '%' print: (self percentageFor: node) value
]

{ #category : #private }
WPB3MessageTallyWebView >> headingRendering: aRenderable [

	^ HeadingWebView displaying: aRenderable withLevel: 4 applying: [ :heading | heading addClass bootstrap3 textInfo ]
]

{ #category : #initialization }
WPB3MessageTallyWebView >> initializeFor: aMessageTally [

	rootTally := aMessageTally
]

{ #category : #rendering }
WPB3MessageTallyWebView >> itemRenderingCommandFor: node [

	^ [ :html | 
	html span with: (self formattedPercentagFor: node) applying: [ :label | label addClass bootstrap3 label + label addClass bootstrap3 labelPrimary ].
	html space.
	html span
		with: [ html
				render: (self timeFor: node);
				space;
				render: 'ms' ]
		applying: [ :label | label addClass bootstrap3 label + label addClass bootstrap3 labelDefault ].
	html
		space;
		render: node method methodClass;
		space;
		render: '>>';
		space;
		render: node method selector;
		render: (self unorderedListRendering: node receivers) ]
]

{ #category : #rendering }
WPB3MessageTallyWebView >> percentageFor: node [

	^ Percentage ratio: (node tally / rootTally tally) 
]

{ #category : #rendering }
WPB3MessageTallyWebView >> renderBoundedContainerWrapping: aRenderable on: html upTo: aMaxHeight [

	html div
		with: aRenderable
		applying: [ :div | 
			(div
				setStyleTo: [ :style :constants | 
					style
						maxHeight: aMaxHeight;
						overflowY: #scroll ]) + div addClass bootstrap3 small ]
]

{ #category : #rendering }
WPB3MessageTallyWebView >> renderContentOn: html [

	self
		renderTreeOn: html;
		renderLeavesOn: html
]

{ #category : #rendering }
WPB3MessageTallyWebView >> renderLeavesOn: html [

	| leavesTable |

	html render: (self headingRendering: 'Leaves').

	leavesTable := self componentSupplier tableBuilder
		addColumn: [ :column | 
			column
				titled: 'Percent';
				rendering: [ :node | self formattedPercentagFor: node ];
				applyingToEachCell: [ :cell | cell addClass bootstrap3 textRight ] ];
		addColumn: [ :column | 
			column
				titled: 'Time (ms)';
				rendering: [ :node | self timeFor: node ];
				applyingToEachCell: [ :cell | cell addClass bootstrap3 textRight ] ];
		addColumn: [ :column | 
			column
				titled: 'Class';
				rendering: [ :node | [ :canvas | canvas strong: node method methodClass ] ] ];
		addColumn: [ :column | 
			column
				titled: 'Selector';
				rendering: [ :node | node method selector ] ];
		build.

	leavesTable changeContentsTo: self tallyLeavesSorted.

	self renderBoundedContainerWrapping: leavesTable on: html upTo: 20 vh
]

{ #category : #rendering }
WPB3MessageTallyWebView >> renderTreeOn: html [

	html render: (self headingRendering: 'Tree').
	self renderBoundedContainerWrapping: (self unorderedListRendering: rootTally receivers) on: html upTo: 40 vh
]

{ #category : #private }
WPB3MessageTallyWebView >> tallyLeavesSorted [

	| dict |

	dict := IdentityDictionary new: 100.
	rootTally leavesInto: dict fromSender: nil.
	^ dict asSortedCollection
]

{ #category : #rendering }
WPB3MessageTallyWebView >> timeFor: node [

	^ ((self percentageFor: node) * rootTally time) rounded
]

{ #category : #rendering }
WPB3MessageTallyWebView >> unorderedListRendering: tallies [

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
