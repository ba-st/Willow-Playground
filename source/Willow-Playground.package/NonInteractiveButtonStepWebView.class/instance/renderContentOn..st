rendering
renderContentOn: aCanvas

	| button |

	self renderSourceOf: #nonInteractiveButton on: aCanvas.

	button := self nonInteractiveButton.
	aCanvas render: button