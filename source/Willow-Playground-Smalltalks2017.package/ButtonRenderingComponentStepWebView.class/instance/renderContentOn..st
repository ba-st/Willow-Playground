rendering
renderContentOn: aCanvas

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
				with: [ :canvas | self renderSourceOf: #initializeCompanionView on: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeButton on: canvas ])
		on: aCanvas