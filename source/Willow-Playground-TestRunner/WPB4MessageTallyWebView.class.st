Class {
	#name : #WPB4MessageTallyWebView,
	#superclass : #WAPainter,
	#instVars : [
		'rootTally'
	],
	#category : #'Willow-Playground-TestRunner-WebViews-Bootstrap-4'
}

{ #category : #'instance creation' }
WPB4MessageTallyWebView class >> for: aMessageTally [

	^ self new initializeFor: aMessageTally
]

{ #category : #rendering }
WPB4MessageTallyWebView >> formattedPercentagFor: node [

	^ (GRNumberPrinter new
		precision: 2;
		yourself) , '%' print: (self percentageFor: node) value
]

{ #category : #private }
WPB4MessageTallyWebView >> headingRendering: aRenderable [

	^ HeadingWebView displaying: aRenderable withLevel: 4 applying: [ :heading | heading addClass bootstrap4 textInfo ]
]

{ #category : #initialization }
WPB4MessageTallyWebView >> initializeFor: aMessageTally [

	rootTally := aMessageTally
]

{ #category : #rendering }
WPB4MessageTallyWebView >> itemRenderingCommandFor: node [

	^ [ :html | 
	html span with: (self formattedPercentagFor: node) applying: [ :label | label addClass bootstrap4 badge + label addClass bootstrap4 badgePrimary ].
	html space.
	html span
		with: [ html
				render: (self timeFor: node);
				space;
				render: 'ms' ]
		applying: [ :label | label addClass bootstrap4 badge + label addClass bootstrap4 badgeSecondary ].
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
WPB4MessageTallyWebView >> percentageFor: node [

	^ Percentage ratio: (node tally / rootTally tally) 
]

{ #category : #rendering }
WPB4MessageTallyWebView >> renderBoundedContainerWrapping: aRenderable on: html upTo: aMaxHeight [

	html div
		with: aRenderable
		applying: [ :div | 
			( div
				setStyleTo: [ :style :constants | 
					style
						maxHeight: aMaxHeight;
						overflowY: #scroll;
						fontSize: #smaller
					] ) + div addClass bootstrap4 width100Percent
			]
]

{ #category : #rendering }
WPB4MessageTallyWebView >> renderContentOn: html [

	self
		renderTreeOn: html;
		renderLeavesOn: html
]

{ #category : #rendering }
WPB4MessageTallyWebView >> renderLeavesOn: html [

	| leavesTable |

	html render: (self headingRendering: 'Leaves').

	leavesTable := self componentSupplier tableBuilder
		addColumn: [ :column | 
			column
				titled: 'Percent';
				rendering: [ :node | self formattedPercentagFor: node ];
				applyingToEachCell: [ :cell | cell addClass bootstrap4 textRight ] ];
		addColumn: [ :column | 
			column
				titled: 'Time (ms)';
				rendering: [ :node | self timeFor: node ];
				applyingToEachCell: [ :cell | cell addClass bootstrap4 textRight ] ];
		addColumn: [ :column | 
			column
				titled: 'Class';
				rendering: [ :node | [ :canvas | canvas strong: node method methodClass ] ] ];
		addColumn: [ :column | 
			column
				titled: 'Selector';
				rendering: [ :node | node method selector ] ];
		buildApplying: [:table | table addClass bootstrap4 tableSmall ].

	leavesTable changeContentsTo: self tallyLeavesSorted.

	self renderBoundedContainerWrapping: leavesTable on: html upTo: 20 vh
]

{ #category : #rendering }
WPB4MessageTallyWebView >> renderTreeOn: html [

	html render: (self headingRendering: 'Tree').
	self renderBoundedContainerWrapping: (self unorderedListRendering: rootTally receivers) on: html upTo: 40 vh
]

{ #category : #private }
WPB4MessageTallyWebView >> tallyLeavesSorted [

	| dict |

	dict := IdentityDictionary new: 100.
	rootTally leavesInto: dict fromSender: nil.
	^ dict asSortedCollection
]

{ #category : #rendering }
WPB4MessageTallyWebView >> timeFor: node [

	^ ((self percentageFor: node) * rootTally time) rounded
]

{ #category : #rendering }
WPB4MessageTallyWebView >> unorderedListRendering: tallies [

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
