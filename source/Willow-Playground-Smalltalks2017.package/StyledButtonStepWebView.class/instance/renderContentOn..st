rendering
renderContentOn: aCanvas

	self renderPanelWrapping: button on: aCanvas.
	
	self renderSourceOf: #initializeButton withBrowseButtonOn: aCanvas.
