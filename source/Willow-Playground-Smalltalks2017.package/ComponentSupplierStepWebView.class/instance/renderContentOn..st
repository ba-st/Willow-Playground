rendering
renderContentOn: aCanvas

	self initializeSuppliedComponents.

	self
		renderCarouselWithAll:
			(Array
				with: [ :canvas | self renderSourceOf: #initializeButton on: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeDropdown on: canvas ]
				with: [ :canvas | self renderSourceOf: #initializeField on: canvas ])
		on: aCanvas.

	self
		renderPanelWrapping:
			(self componentSupplier gridBuilder
				columnsWidths: #(4 4 4);
				addContent: button;
				addContent: dropdown;
				addContent: field;
				build)
		on: aCanvas