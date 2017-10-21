rendering
renderContentOn: aCanvas

	self renderSourceOf: #initializeField withBrowseButtonOn: aCanvas.
	self renderSourceOf: #initializeButton withBrowseButtonOn: aCanvas.
	self renderSourceOf: #renderFormOn: withBrowseButtonOn: aCanvas.

	self renderPanelWrapping: [ :canvas | self renderFormOn: canvas ] on: aCanvas