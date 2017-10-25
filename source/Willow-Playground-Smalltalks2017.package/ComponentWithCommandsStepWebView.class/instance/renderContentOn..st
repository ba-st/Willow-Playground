rendering
renderContentOn: aCanvas

	self renderPanelWrapping: input on: aCanvas.
	
	self renderSourceOf: #initializeField withBrowseButtonOn: aCanvas.
