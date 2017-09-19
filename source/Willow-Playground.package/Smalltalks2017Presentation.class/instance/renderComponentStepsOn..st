private - Rendering
renderComponentStepsOn: canvas

	canvas
		listItem: [ canvas render: 'Components'.
			canvas orderedList
				type: '1';
				with: [ self renderButtonStepsOn: canvas.
					self renderFormStepsOn: canvas.
					self renderDialogStepsOn: canvas.
					self renderSummarizedOthersStepsOn: canvas ] ]