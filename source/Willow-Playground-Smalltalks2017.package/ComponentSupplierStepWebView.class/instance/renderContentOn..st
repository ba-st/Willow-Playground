rendering
renderContentOn: aCanvas

	self
		renderPanelWrapping:
			(self componentSupplier gridBuilder
				columnsWidths: #(4 4 4);
				addContent: button;
				addContent: dropdown;
				addContent: field;
				build)
		on: aCanvas.

	self
		renderCodeCarouselWithAll:
			(Array
				with: [ :canvas | self renderSourceOf: #initializeButton withBrowseButtonOn: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeDropdown withBrowseButtonOn: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeField withBrowseButtonOn: canvas ])
		on: aCanvas