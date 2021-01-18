"
I'm a step showing the component supplier.
"
Class {
	#name : #ComponentSupplierStepWebView,
	#superclass : #PresentationStepWebView,
	#instVars : [
		'button',
		'dropdown',
		'field'
	],
	#category : #'Willow-Playground-Smalltalks2017-WebViews'
}

{ #category : #accessing }
ComponentSupplierStepWebView >> description [

	^ 'The supplier provides access to customized components'
]

{ #category : #initialization }
ComponentSupplierStepWebView >> initialize [

	super initialize.
	self initializeButton.
	self initializeDropdown.
	self initializeField
]

{ #category : #initialization }
ComponentSupplierStepWebView >> initializeButton [
	button := self componentSupplier
		asynchronicButtonLabeled: 'I am a button'
		applying: [ :theButton |  ]
]

{ #category : #initialization }
ComponentSupplierStepWebView >> initializeDropdown [
	dropdown := self componentSupplier
		dropdownListApplying: [ :theDropdown |  ].
	dropdown allowAnyOf: self supplyingSelectors
]

{ #category : #initialization }
ComponentSupplierStepWebView >> initializeField [

	field := self componentSupplier dateFieldApplying: [ :theField |  ]
 
]

{ #category : #rendering }
ComponentSupplierStepWebView >> renderContentOn: aCanvas [

	self
		renderPanelWrapping:
			(self componentSupplier gridBuilder
				columnsWidths: #(4 4 4);
				addContent: button;
				addContent: dropdown;
				addContent: field;
				build)
		on: aCanvas.

	self
		renderCarouselWithAll:
			(Array
				with: [ :canvas | self renderSourceOf: #initializeButton withBrowseButtonOn: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeDropdown withBrowseButtonOn: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeField withBrowseButtonOn: canvas ])
		on: aCanvas
]

{ #category : #accessing }
ComponentSupplierStepWebView >> shortName [

	^ 'Component Supplier'
]

{ #category : #'private-accessing' }
ComponentSupplierStepWebView >> supplyingSelectors [

	^ (self componentSupplier class localMethods
		select: [ :method | method category = 'Supplying' ]
		thenCollect: #selector) sorted
]
