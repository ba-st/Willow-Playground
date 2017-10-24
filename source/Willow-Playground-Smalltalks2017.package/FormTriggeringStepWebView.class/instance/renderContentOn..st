rendering
renderContentOn: aCanvas

	self renderPanelWrapping: [ :canvas | self renderFormOn: canvas ] on: aCanvas.

	self
		renderCarouselWithAll:
			(Array
				with: [ :canvas | self renderSourceOf: #initializeField on: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeButton on: canvas ]
				with: [ :canvas | self renderSourceOf: #renderFormOn: on: canvas ])
		on: aCanvas