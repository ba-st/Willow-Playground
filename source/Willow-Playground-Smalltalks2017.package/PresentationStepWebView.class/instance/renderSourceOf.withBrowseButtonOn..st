private-rendering
renderSourceOf: aSelector withBrowseButtonOn: aCanvas

	aCanvas render: self browseStepButton.
	self renderSourceOf: aSelector on: aCanvas