"
I'm a step showing a form triggering.
"
Class {
	#name : #FormTriggeringStepWebView,
	#superclass : #PresentationStepWebView,
	#instVars : [
		'button',
		'input'
	],
	#category : #'Willow-Playground-Smalltalks2017-WebViews'
}

{ #category : #'private-rendering' }
FormTriggeringStepWebView >> askDeveloper: aQuestion [

	^ UIManager default textEntry: aQuestion
]

{ #category : #accessing }
FormTriggeringStepWebView >> description [

	^ 'This button "submits" the form'
]

{ #category : #initialization }
FormTriggeringStepWebView >> initialize [

	super initialize.
	self initializeField.
	self initializeButton
]

{ #category : #initialization }
FormTriggeringStepWebView >> initializeButton [

	button := AsynchronicButtonWebView labeled: 'Ask it!'.
	button on trigger
		serializeContainerForm;
		disable;
		serverDo: [ :request | 
			| answer |

			answer := self askDeveloper: input contents.
			request onRespond setValueTo: answer thenTriggerChangeOf: input
			]
]

{ #category : #initialization }
FormTriggeringStepWebView >> initializeField [


	input := TextFieldWebView
		 singleLineApplying: [ :theInput |  ]
		
		
		
		 
]

{ #category : #rendering }
FormTriggeringStepWebView >> renderContentOn: aCanvas [

	self renderPanelWrapping: [ :canvas | self renderFormOn: canvas ] on: aCanvas.

	self
		renderCarouselWithAll:
			(Array
				with: [ :canvas | self renderSourceOf: #initializeField withBrowseButtonOn: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeButton withBrowseButtonOn: canvas ]
				with: [ :canvas | self renderSourceOf: #renderFormOn: withBrowseButtonOn: canvas ])
		on: aCanvas
]

{ #category : #'private-rendering' }
FormTriggeringStepWebView >> renderFormOn: aCanvas [

	aCanvas form
		doNotSubmit;
		with: [
			input identifierOn: aCanvas.
			self renderQuestionComponentsOn: aCanvas ]

 
]

{ #category : #'private-rendering' }
FormTriggeringStepWebView >> renderQuestionComponentsOn: aCanvas [

	aCanvas
		render:
			(self componentSupplier gridBuilder
				columnsWidths: #(2 2 4 2 2);
				addContent: '';
				addContent: 'Enter a question';
				addContent: input;
				addContent: button;
				addContent: '';
				build)
]

{ #category : #accessing }
FormTriggeringStepWebView >> shortName [

	^ 'Form To Submit'
]
