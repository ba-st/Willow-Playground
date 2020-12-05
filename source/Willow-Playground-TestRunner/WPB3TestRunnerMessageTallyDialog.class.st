"
I'm a Dialog showing the message tally results.
"
Class {
	#name : #WPB3TestRunnerMessageTallyDialog,
	#superclass : #WAPainter,
	#instVars : [
		'dialog'
	],
	#category : #'Willow-Playground-TestRunner-WebViews-Bootstrap-3'
}

{ #category : #initialization }
WPB3TestRunnerMessageTallyDialog >> initialize [

	super initialize.
	dialog := self componentSupplier dialogBuilder
		headerTitled: 'Message Tally Result';
		wrapping: [ :canvas | self renderTallyOn: canvas ];
		closeButtonLabeled: 'Close' applying: [ :button | button addClass bootstrap3 buttonLink ];
		beSelfCleaning;
		buildApplying: [ :document | document addClass bootstrap3 modalLarge ]
]

{ #category : #rendering }
WPB3TestRunnerMessageTallyDialog >> renderContentOn: html [

	html render: dialog
]

{ #category : #rendering }
WPB3TestRunnerMessageTallyDialog >> renderTallyOn: html [

	self session applicationContext
		withMessageTallyDo: [ :tally | html render: (WPB3MessageTallyWebView for: tally) ]
		ifNone: [ html
				render: (Bootstrap3IconWebView representing: Glyphicons flash);
				space;
				render: 'Wow! That was fast... no time to take a tally' ]
]
