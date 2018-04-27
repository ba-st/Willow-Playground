"
I'm a step showing some complex components.
"
Class {
	#name : #AdvancedComponentsExampleStepWebView,
	#superclass : #PresentationStepWebView,
	#instVars : [
		'tableBuilder',
		'table',
		'periodical',
		'delayed'
	],
	#category : #'Willow-Playground-Smalltalks2017-WebViews'
}

{ #category : #'private-accessing' }
AdvancedComponentsExampleStepWebView >> currentTime [

	^ GRPrinter isoTime print: Time now
]

{ #category : #accessing }
AdvancedComponentsExampleStepWebView >> description [

	^ 'Some components provide additional features'
]

{ #category : #initialization }
AdvancedComponentsExampleStepWebView >> initialize [

	super initialize.
	self initializeTable.
	self initializePeriodical.
]

{ #category : #initialization }
AdvancedComponentsExampleStepWebView >> initializeDelayed [
	delayed := DelayedViewRenderer
		showing: SpinKitCubeGrid new
		whileEvaluating: [ self makeHeavyCalculations ]
		thenRendering: [ :canvas | canvas 
							render: periodical;
							render: table ]
]

{ #category : #initialization }
AdvancedComponentsExampleStepWebView >> initializePeriodical [
	periodical := PeriodicallyRenderedWebView
		evaluating: [  ] every: 1000 millisecondsThenRendering:
			[ :canvas | canvas
				render: 'The time now is ';
				strong: self currentTime ]
		until: [ false ]
]

{ #category : #initialization }
AdvancedComponentsExampleStepWebView >> initializeTable [
	table := TableWebViewBuilder new
	  addColumnTitled: 'Decimal' rendering: [ :number | number ];
	  addColumnTitled: 'Hex' rendering: [ :number | number printStringHex ];
	  addColumnTitled: 'Roman' rendering: [ :number | number printStringRoman ];
	  buildApplying: [ :theTable | theTable addClass bootstrap table ].
	table changeContentsTo: #(26 51 78)
]

{ #category : #'private-computing' }
AdvancedComponentsExampleStepWebView >> makeHeavyCalculations [

	^ (Delay forSeconds: 2) wait
]

{ #category : #rendering }
AdvancedComponentsExampleStepWebView >> renderContentOn: aCanvas [

	self initializeDelayed.
	self renderPanelWrapping: delayed on: aCanvas.

	self
		renderCarouselWithAll:
			(Array
				with: [ :canvas | self renderSourceOf: #initializeDelayed withBrowseButtonOn: canvas ]
				with: [ :canvas | self renderSourceOf: #initializePeriodical withBrowseButtonOn: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeTable withBrowseButtonOn: canvas ])
		on: aCanvas
]

{ #category : #accessing }
AdvancedComponentsExampleStepWebView >> shortName [

	^ 'Advanced components'
]
