rendering
renderContentOn: aCanvas

	| button |

	self renderSourceOf: #buttonExecutingOnClient on: aCanvas.
	button := self buttonExecutingOnClient.
	aCanvas render: button