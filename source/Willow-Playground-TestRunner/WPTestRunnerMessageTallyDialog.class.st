"
I'm a Dialog showing the message tally results.
"
Class {
	#name : #WPTestRunnerMessageTallyDialog,
	#superclass : #WAPainter,
	#instVars : [
		'dialog'
	],
	#category : #'Willow-Playground-TestRunner-WebViews'
}

{ #category : #initialization }
WPTestRunnerMessageTallyDialog >> initialize [

	super initialize.
	dialog := self componentSupplier dialogBuilder
		headerTitled: 'Message Tally Result';
		wrapping: [ :canvas | self renderTallyOn: canvas ];
		closeButtonLabeled: 'Close' applying: [ :button | button addClass bootstrap buttonLink ];
		beSelfCleaning;
		buildApplying: [ :document | document addClass bootstrap modalLarge ]
]

{ #category : #rendering }
WPTestRunnerMessageTallyDialog >> renderContentOn: html [

	html render: dialog
]

{ #category : #rendering }
WPTestRunnerMessageTallyDialog >> renderTallyOn: html [

	self session applicationContext
		withMessageTallyDo: [ :tally | html render: (WPMessageTallyWebView for: tally) ]
		ifNone: [ html
				render: (BootstrapIconWebView representing: Glyphicons flash);
				space;
				render: 'Wow! That was fast... no time to take a tally' ]
]
