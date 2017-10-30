rendering
renderContentOn: aCanvas

	self
		renderPanelWrapping:
			(self componentSupplier gridBuilder
				columnsWidths: #(1 3 3 3 2);
				addContent: '';
				addContent: dropdown;
				addContent: checkbox;
				addContent: image;
				addContent: '';
				build)
		on: aCanvas.

	self
		renderCodeCarouselWithAll:
			(Array
				with: [ :canvas | self renderSourceOf: #initializeDropDownListView withBrowseButtonOn: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeCheckboxView withBrowseButtonOn: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeImageView withBrowseButtonOn: canvas ])
		on: aCanvas