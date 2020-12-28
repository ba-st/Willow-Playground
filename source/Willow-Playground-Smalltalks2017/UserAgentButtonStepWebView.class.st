"
I'm a step showing a button executing code on the client.
"
Class {
	#name : #UserAgentButtonStepWebView,
	#superclass : #PresentationStepWebView,
	#instVars : [
		'button'
	],
	#category : #'Willow-Playground-Smalltalks2017-WebViews'
}

{ #category : #accessing }
UserAgentButtonStepWebView >> description [

	^ 'This button will trigger an action on the browser'
]

{ #category : #initialization }
UserAgentButtonStepWebView >> initialize [

	super initialize.
	self initializeButton
]

{ #category : #initialization }
UserAgentButtonStepWebView >> initializeButton [

	button := AsynchronicButtonWebView labeled: 'Now it''s time to click'.
	button on trigger userAgentDo: [ :canvas | canvas javascript alert: 'You just clicked a button' ]
]

{ #category : #rendering }
UserAgentButtonStepWebView >> renderContentOn: aCanvas [

	self renderPanelWrapping: button on: aCanvas.
	
	self renderSourceOf: #initializeButton withBrowseButtonOn: aCanvas.

]

{ #category : #accessing }
UserAgentButtonStepWebView >> shortName [

	^ 'A User Agent Effect Button'
]
