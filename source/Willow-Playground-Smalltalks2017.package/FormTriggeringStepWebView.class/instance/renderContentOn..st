rendering
renderContentOn: aCanvas

	self renderPanelWrapping: [ :canvas | self renderFormOn: canvas ] on: aCanvas.

	self
		renderCarouselWithAll:
			(Array
				with: [ :canvas | self renderSourceOf: #initializeField withBrowseButtonOn: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeButton withBrowseButtonOn: canvas ]
				with: [ :canvas | self renderSourceOf: #renderFormOn: withBrowseButtonOn: canvas ])
		on: aCanvas