rendering
renderContentOn: aCanvas

	self renderPanelWrapping: delayed on: aCanvas.
	
	self
		renderCarouselWithAll:
			(Array
				with: [ :canvas | self renderSourceOf: #initializeDelayed on: canvas ]
				with: [ :canvas | self renderSourceOf: #initializePeriodical on: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeTable on: canvas ])
		on: aCanvas.
