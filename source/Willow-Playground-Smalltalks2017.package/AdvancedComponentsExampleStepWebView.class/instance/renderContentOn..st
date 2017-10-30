rendering
renderContentOn: aCanvas

	self initializeDelayed.
	self renderPanelWrapping: delayed on: aCanvas.

	self
		renderCarouselWithAll:
			(Array
				with: [ :canvas | self renderSourceOf: #initializeDelayed withBrowseButtonOn: canvas ]
				with: [ :canvas | self renderSourceOf: #initializePeriodical withBrowseButtonOn: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeTable withBrowseButtonOn: canvas ])
		on: aCanvas