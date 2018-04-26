"
I'm a step showing the rendering basics.
"
Class {
	#name : #ButtonRenderingComponentStepWebView,
	#superclass : #PresentationStepWebView,
	#instVars : [
		'button',
		'companionView'
	],
	#category : #'Willow-Playground-Smalltalks2017-WebViews'
}

{ #category : #'private-accessing' }
ButtonRenderingComponentStepWebView >> currentTime [

	^ GRPrinter isoTime print: Time now
]

{ #category : #accessing }
ButtonRenderingComponentStepWebView >> description [

	^ 'This button will "render" content next to it'
]

{ #category : #initialization }
ButtonRenderingComponentStepWebView >> initialize [

	super initialize.
	self initializeCompanionView.
	self initializeButton
]

{ #category : #initialization }
ButtonRenderingComponentStepWebView >> initializeButton [
	button := AsynchronicButtonWebView labeled: 'Click for a change'.
	button onTrigger
		render: companionView
]

{ #category : #initialization }
ButtonRenderingComponentStepWebView >> initializeCompanionView [
	companionView := IdentifiedWebView
		forSpanNamed: 'Companion'
		containing: [ :canvas | canvas strong: self currentTime ]
]

{ #category : #rendering }
ButtonRenderingComponentStepWebView >> renderContentOn: aCanvas [

	self
		renderPanelWrapping:
			(self componentSupplier gridBuilder
				columnsWidths: #(2 5 4 1);
				addContent: '';
				addContent: button;
				addContent: companionView;
				addContent: '';
				build)
		on: aCanvas.

	self
		renderCarouselWithAll:
			(Array
				with: [ :canvas | self renderSourceOf: #initializeCompanionView withBrowseButtonOn: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeButton withBrowseButtonOn: canvas ])
		on: aCanvas
]

{ #category : #accessing }
ButtonRenderingComponentStepWebView >> shortName [

	^ 'A Rendering Button'
]
