"
I'm a step showing a non interactive button
"
Class {
	#name : #NonInteractiveButtonStepWebView,
	#superclass : #PresentationStepWebView,
	#category : #'Willow-Playground-Smalltalks2017-WebViews'
}

{ #category : #accessing }
NonInteractiveButtonStepWebView >> description [

	^ 'Starting small: a non-interactive button'
]

{ #category : #'private-accessing' }
NonInteractiveButtonStepWebView >> nonInteractiveButton [
	^ AsynchronicButtonWebView labeled: 'Nothing to do'
]

{ #category : #rendering }
NonInteractiveButtonStepWebView >> renderContentOn: aCanvas [

	self renderPanelWrapping: self nonInteractiveButton on: aCanvas.
	
	self renderSourceOf: #nonInteractiveButton withBrowseButtonOn: aCanvas.

]

{ #category : #accessing }
NonInteractiveButtonStepWebView >> shortName [

	^ 'A Simple Button'
]
