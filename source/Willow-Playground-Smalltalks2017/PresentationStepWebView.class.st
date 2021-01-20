"
I'm an abstract presentation step. Providing facilities used by all the steps.
"
Class {
	#name : #PresentationStepWebView,
	#superclass : #WAPainter,
	#category : #'Willow-Playground-Smalltalks2017-WebViews'
}

{ #category : #'private-accessing' }
PresentationStepWebView >> browseStepButtonEvaluating: aCallback [

	| browseButton |

	browseButton := self componentSupplier
		asynchronicButtonLabeled: 'Browse'
		applying: [ :theButton | 
			theButton addClass bootstrap3 buttonDefault + theButton addClass bootstrap3 buttonSmall
				+ theButton addClass smalltalks2017 browseStep
			].
	browseButton on trigger serverDo: aCallback.
	^ browseButton
]

{ #category : #accessing }
PresentationStepWebView >> description [

	self subclassResponsibility
]

{ #category : #'private-rendering' }
PresentationStepWebView >> renderCarouselControlIn: carouselIdentifier slidingTo: aSlideTarget anchorStyledWith: anAnchorClass spanStyledWith: aSpanClass named: aName on: aCanvas [

	aCanvas anchor
		class: anAnchorClass;
		class: 'carousel-control';
		url: ( '#<1s>' expandMacrosWith: carouselIdentifier );
		attributeAt: 'role' put: 'button';
		attributeAt: 'data-slide' put: aSlideTarget;
		setStyleTo: [ :style | 
			style
				maxWidth: 50 px;
				background: #none
			];
		with: [ aCanvas span
				apply: [ :span | span addClass bootstrap3 glyphicon + ( span setARIAAttribute: 'hidden' to: true ) ];
				class: aSpanClass.
			aCanvas span with: aName applying: [ :div | div addClass bootstrap3 screenReaderOnly ]
			]
]

{ #category : #'private-rendering' }
PresentationStepWebView >> renderCarouselControlsIn: carouselIdentifier on: aCanvas [

	self
		renderCarouselControlIn: carouselIdentifier
		slidingTo: 'prev'
		anchorStyledWith: 'left'
		spanStyledWith: Glyphicons chevronLeft
		named: 'Previous'
		on: aCanvas.
	self
		renderCarouselControlIn: carouselIdentifier
		slidingTo: 'next'
		anchorStyledWith: 'right'
		spanStyledWith: Glyphicons chevronRight
		named: 'Next'
		on: aCanvas
]

{ #category : #'private-rendering' }
PresentationStepWebView >> renderCarouselSlidesContainerForAll: aRenderableCollection on: aCanvas [

	aCanvas div
		class: 'carousel-inner';
		attributeAt: 'role' put: 'listbox';
		with: [ self renderSlidesForAll: aRenderableCollection on: aCanvas ]
]

{ #category : #'private-rendering' }
PresentationStepWebView >> renderCarouselWithAll: aRenderableCollection on: aCanvas [

	| carouselIdentifier |

	carouselIdentifier := 'theCarousel'.
	aCanvas div
		id: carouselIdentifier;
		class: 'carousel';
		class: 'slide';
		attributeAt: 'data-ride' put: 'carousel';
		script: ((aCanvas jQuery class: 'carousel') call: 'carousel' with: 'pause');
		with: [ self renderCarouselSlidesContainerForAll: aRenderableCollection on: aCanvas.
			self renderCarouselControlsIn: carouselIdentifier on: aCanvas ]
]

{ #category : #'private-rendering' }
PresentationStepWebView >> renderPanelWrapping: aRenderable on: aCanvas [

	| panel |

	panel := self componentSupplier panelBuilder
		headingDisplaying: self description;
		wrapping: aRenderable;
		buildApplying: [ :thePanel | thePanel addClass bootstrap3 panelDefault ].

	aCanvas render: panel
]

{ #category : #'private-rendering' }
PresentationStepWebView >> renderSlidesForAll: aRenderableCollection on: aCanvas [

	aRenderableCollection
		doWithIndex: [ :renderable :index | 
			| component |

			component := aCanvas div.
			component class: 'item'.
			renderable = aRenderableCollection first
				ifTrue: [ component apply: [ :div | div addClass bootstrap3 active ] ].
			component with: renderable ]
]

{ #category : #'private-rendering' }
PresentationStepWebView >> renderSourceOf: aSelector andBrowseButton: aButtonOptional on: aCanvas [

	| sourceCodeString |

	sourceCodeString := self class sourceCodeAt: aSelector.
	sourceCodeString := sourceCodeString copyAfter: Character cr.
	aCanvas preformatted
		class: 'smalltalk';
		with: [ aButtonOptional withContentDo: [ :button | aCanvas render: button ].
			aCanvas code: sourceCodeString ].

	aCanvas document
		addLoadScript:
			(JSStream
				on:
					'$("pre code").each(function(i, block) {
    hljs.highlightBlock(block);
  });')
]

{ #category : #'private-rendering' }
PresentationStepWebView >> renderSourceOf: aSelector on: aCanvas [

	self renderSourceOf: aSelector andBrowseButton: Optional unused on: aCanvas
]

{ #category : #'private-rendering' }
PresentationStepWebView >> renderSourceOf: aSelector withBrowseButtonOn: aCanvas [

	self
		renderSourceOf: aSelector
		andBrowseButton: (Optional containing: (self browseStepButtonEvaluating: [ (self class >> aSelector) browse ]))
		on: aCanvas
]

{ #category : #accessing }
PresentationStepWebView >> shortName [

	self subclassResponsibility
]
