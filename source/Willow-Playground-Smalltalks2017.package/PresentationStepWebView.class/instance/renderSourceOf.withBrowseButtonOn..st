private-rendering
renderSourceOf: aSelector withBrowseButtonOn: aCanvas

	| browseButton |

	browseButton := self browseStepButton.
	aCanvas render: browseButton.
	self renderSourceOf: aSelector on: aCanvas