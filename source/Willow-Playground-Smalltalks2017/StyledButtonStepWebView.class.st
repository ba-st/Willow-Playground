"
I'm a step showing a button with some sytle.
"
Class {
	#name : #StyledButtonStepWebView,
	#superclass : #PresentationStepWebView,
	#instVars : [
		'button'
	],
	#category : #'Willow-Playground-Smalltalks2017-WebViews'
}

{ #category : #accessing }
StyledButtonStepWebView >> description [

	^ 'You can add special styles to components'
]

{ #category : #initialization }
StyledButtonStepWebView >> initialize [

	super initialize.
	self initializeButton
]

{ #category : #initialization }
StyledButtonStepWebView >> initializeButton [

	button := AsynchronicButtonWebView
		labeled: 'Primary Bootstrap Button'
		applying:
			[ :theButton | theButton addClass bootstrap3 button + theButton addClass bootstrap3 buttonPrimary ]
]

{ #category : #rendering }
StyledButtonStepWebView >> renderContentOn: aCanvas [

	self renderPanelWrapping: button on: aCanvas.
	
	self renderSourceOf: #initializeButton withBrowseButtonOn: aCanvas.

]

{ #category : #accessing }
StyledButtonStepWebView >> shortName [

	^ 'A Styled Button'
]
