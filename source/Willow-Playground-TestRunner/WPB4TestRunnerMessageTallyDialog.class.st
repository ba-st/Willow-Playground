Class {
	#name : #WPB4TestRunnerMessageTallyDialog,
	#superclass : #WAPainter,
	#instVars : [
		'dialog'
	],
	#category : #'Willow-Playground-TestRunner-WebViews-Bootstrap-4'
}

{ #category : #initialization }
WPB4TestRunnerMessageTallyDialog >> initialize [

	super initialize.
	dialog := self componentSupplier dialogBuilder
		headerTitled: 'Message Tally Result';
		wrapping: [ :canvas | self renderTallyOn: canvas ];
		closeButtonLabeled: 'Close' applying: [ :button | button addClass bootstrap4 buttonLink ];
		beSelfCleaning;
		buildApplying: [ :document | document addClass bootstrap4 modalLarge ]
]

{ #category : #rendering }
WPB4TestRunnerMessageTallyDialog >> renderContentOn: html [

	html render: dialog
]

{ #category : #rendering }
WPB4TestRunnerMessageTallyDialog >> renderTallyOn: html [

	self session applicationContext
		withMessageTallyDo: [ :tally | html render: ( WPB4MessageTallyWebView for: tally ) ]
		ifNone: [ html render: 'Wow! That was fast... no time to take a tally' ]
]
