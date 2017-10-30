rendering
renderContentOn: aCanvas

	self initializeDelayed.
	self renderPanelWrapping: delayed on: aCanvas.

	self
		renderCodeCarouselWithAll:
			(Array
				with: [ :canvas | self renderSourceOf: #initializeDelayed on: canvas ]
				with: [ :canvas | self renderSourceOf: #initializePeriodical on: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeTable on: canvas ])
		on: aCanvas