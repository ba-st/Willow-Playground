"
I'm a step showing a button executing code on the client.
"
Class {
	#name : #ButtonExecutingOnClientStepWebView,
	#superclass : #PresentationStepWebView,
	#instVars : [
		'button'
	],
	#category : 'Willow-Playground-Smalltalks2017'
}

{ #category : #accessing }
ButtonExecutingOnClientStepWebView >> description [

	^ 'This button will trigger an action on the browser'
]

{ #category : #initialization }
ButtonExecutingOnClientStepWebView >> initialize [

	super initialize.
	self initializeButton
]

{ #category : #initialization }
ButtonExecutingOnClientStepWebView >> initializeButton [

 button := AsynchronicButtonWebView labeled: 'Now it''s time to click'.
 button onTrigger
	executeOnClient: [ :script :scriptCanvas |
				script << scriptCanvas
				javascript alert: 'You just clicked a button' ]
 
]

{ #category : #rendering }
ButtonExecutingOnClientStepWebView >> renderContentOn: aCanvas [

	self renderPanelWrapping: button on: aCanvas.
	
	self renderSourceOf: #initializeButton withBrowseButtonOn: aCanvas.

]

{ #category : #accessing }
ButtonExecutingOnClientStepWebView >> shortName [

	^ 'A Client Effect Button'
]
