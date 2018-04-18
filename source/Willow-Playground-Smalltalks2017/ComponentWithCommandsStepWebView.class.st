"
I'm a step showing a component with commands.
"
Class {
	#name : #ComponentWithCommandsStepWebView,
	#superclass : #PresentationStepWebView,
	#instVars : [
		'input'
	],
	#category : 'Willow-Playground-Smalltalks2017'
}

{ #category : #accessing }
ComponentWithCommandsStepWebView >> description [

	^ 'Components can be configured with many commands'
]

{ #category : #initialization }
ComponentWithCommandsStepWebView >> initialize [

	super initialize.
	self initializeField 
]

{ #category : #initialization }
ComponentWithCommandsStepWebView >> initializeField [
 input := TextFieldWebView
	singleLineTriggeringOnChangeApplying:
		[ :theField |	theField bePasswordInput + 
				(theField setPlaceholderTo: 'Tell me your secrets') ]
]

{ #category : #rendering }
ComponentWithCommandsStepWebView >> renderContentOn: aCanvas [

	self renderPanelWrapping: input on: aCanvas.
	
	self renderSourceOf: #initializeField withBrowseButtonOn: aCanvas.

]

{ #category : #accessing }
ComponentWithCommandsStepWebView >> shortName [

	^ 'Commands To Components'
]
