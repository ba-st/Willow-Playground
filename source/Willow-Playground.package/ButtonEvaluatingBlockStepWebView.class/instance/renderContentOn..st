rendering
renderContentOn: aCanvas

	| button |

	self renderSourceOf: #buttonEvaluatingBlock on: aCanvas.
	button := self buttonEvaluatingBlock.
	aCanvas render: button