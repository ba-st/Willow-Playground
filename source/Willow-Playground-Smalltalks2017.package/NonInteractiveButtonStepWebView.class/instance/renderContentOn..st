rendering
renderContentOn: aCanvas

	self renderSourceOf: #nonInteractiveButton withBrowseButtonOn: aCanvas.

	self renderPanelWrapping: self nonInteractiveButton on: aCanvas