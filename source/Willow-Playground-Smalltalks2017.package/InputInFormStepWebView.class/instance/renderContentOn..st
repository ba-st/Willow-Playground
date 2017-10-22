rendering
renderContentOn: aCanvas

	self renderSourceOf: #initializeField withBrowseButtonOn: aCanvas.

	self renderPanelWrapping: [ :canvas | canvas form: input ] on: aCanvas