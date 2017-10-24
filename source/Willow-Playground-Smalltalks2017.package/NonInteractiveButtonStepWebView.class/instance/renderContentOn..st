rendering
renderContentOn: aCanvas

	self renderPanelWrapping: self nonInteractiveButton on: aCanvas.
	
	self renderSourceOf: #nonInteractiveButton withBrowseButtonOn: aCanvas.
