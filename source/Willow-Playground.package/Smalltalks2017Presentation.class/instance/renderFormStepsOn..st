private - Rendering
renderFormStepsOn: canvas

	canvas
		listItem: [ canvas render: 'Input + Button (Form)'.
			canvas orderedList
				type: 'a';
				with: [ canvas
						listItem: 'Sin interacción';
						listItem: 'Button seralize form + render en base a input' ] ]