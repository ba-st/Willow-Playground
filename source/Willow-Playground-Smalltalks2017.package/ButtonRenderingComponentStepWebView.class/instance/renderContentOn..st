rendering
renderContentOn: aCanvas

	self
		renderCarouselWithAll:
			(Array
				with: [ :canvas | self renderSourceOf: #initializeCompanionView on: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeButton on: canvas ])
		on: aCanvas.

	self
		renderPanelWrapping: [ :canvas | 
			canvas div
				class: (BootstrapCssStyles columnMedium: 6);
				with: button.
			canvas div
				class: (BootstrapCssStyles columnMedium: 6);
				with: companionView ]
		on: aCanvas