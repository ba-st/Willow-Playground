rendering
renderContentOn: aCanvas

	self renderSourceOf: #initializeDropDownListView withBrowseButtonOn: aCanvas.
	self renderSourceOf: #initializeCheckboxView withBrowseButtonOn: aCanvas.
	self renderSourceOf: #initializeImageView withBrowseButtonOn: aCanvas.

	self
		renderPanelWrapping: [ :canvas | 
			canvas
				paragraph: dropdown;
				paragraph: checkbox;
				paragraph: image ]
		on: aCanvas