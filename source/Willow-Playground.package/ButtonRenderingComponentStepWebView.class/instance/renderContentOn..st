rendering
renderContentOn: aCanvas

	| button companion |

	self renderSourceOf: #companionView on: aCanvas.
	self renderSourceOf: #buttonRendering: on: aCanvas.
	companion := self companionView.
	button := self buttonRendering: companion.
	aCanvas
		render: button;
		render: companion