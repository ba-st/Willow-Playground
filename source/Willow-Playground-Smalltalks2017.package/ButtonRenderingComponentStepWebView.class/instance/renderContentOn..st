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
		renderCodeCarouselWithAll:
			(Array
				with: [ :canvas | self renderSourceOf: #initializeCompanionView withBrowseButtonOn: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeButton withBrowseButtonOn: canvas ])
		on: aCanvas