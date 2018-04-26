"
I'm a step showing a componente summary.
"
Class {
	#name : #ComponentSummaryStepWebView,
	#superclass : #PresentationStepWebView,
	#instVars : [
		'checkbox',
		'image',
		'dropdown'
	],
	#category : #'Willow-Playground-Smalltalks2017-WebViews'
}

{ #category : #accessing }
ComponentSummaryStepWebView >> description [

	^ 'There are many more components to choose from'
]

{ #category : #initialization }
ComponentSummaryStepWebView >> initialize [

	super initialize.
	self initializeDropDownListView.
	self initializeCheckboxView.
	self initializeImageView
]

{ #category : #initialization }
ComponentSummaryStepWebView >> initializeCheckboxView [
	checkbox := CheckboxWebView
		labeled: 'Make a choice'
		onModel: 10 offModel: -10
		applying: [ :theCheckbox |  ]
]

{ #category : #initialization }
ComponentSummaryStepWebView >> initializeDropDownListView [
	dropdown := DropDownListWebView applying: [ :theDropdown |  ].
	
	dropdown allowAnyOf:
		#('Smartphone' 'Tablet' 'Destkop' 'Notebook' 'Arduino')
]

{ #category : #initialization }
ComponentSummaryStepWebView >> initializeImageView [
	image := ImageWebView
		locatedAt:
			Smalltalks2017FileMetadataLibrary / #smalltalk80bookJpg
		applying: [ :theImage |  ]
]

{ #category : #rendering }
ComponentSummaryStepWebView >> renderContentOn: aCanvas [

	self
		renderPanelWrapping:
			(self componentSupplier gridBuilder
				columnsWidths: #(1 3 3 3 2);
				addContent: '';
				addContent: dropdown;
				addContent: checkbox;
				addContent: image;
				addContent: '';
				build)
		on: aCanvas.

	self
		renderCarouselWithAll:
			(Array
				with: [ :canvas | self renderSourceOf: #initializeDropDownListView withBrowseButtonOn: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeCheckboxView withBrowseButtonOn: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeImageView withBrowseButtonOn: canvas ])
		on: aCanvas
]

{ #category : #accessing }
ComponentSummaryStepWebView >> shortName [

	^ 'Component Summary'
]
