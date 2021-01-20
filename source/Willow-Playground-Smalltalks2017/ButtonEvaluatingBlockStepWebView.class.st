"
I'm a step showing a button evaluating a callback.
"
Class {
	#name : #ButtonEvaluatingBlockStepWebView,
	#superclass : #PresentationStepWebView,
	#instVars : [
		'button'
	],
	#category : #'Willow-Playground-Smalltalks2017-WebViews'
}

{ #category : #accessing }
ButtonEvaluatingBlockStepWebView >> description [

	^ 'This button will open an inspector on the image'
]

{ #category : #initialization }
ButtonEvaluatingBlockStepWebView >> initialize [

	super initialize.
	self initializeButton
]

{ #category : #initialization }
ButtonEvaluatingBlockStepWebView >> initializeButton [

	button := AsynchronicButtonWebView labeled: 'Click... then check your image'.
	button on trigger serverDo: [ 'The button was clicked on the browser' inspect ]
]

{ #category : #rendering }
ButtonEvaluatingBlockStepWebView >> renderContentOn: aCanvas [

	self renderPanelWrapping: button on: aCanvas.
	
	self renderSourceOf: #initializeButton withBrowseButtonOn: aCanvas.

]

{ #category : #accessing }
ButtonEvaluatingBlockStepWebView >> shortName [

	^ 'A Server Effect Button'
]
