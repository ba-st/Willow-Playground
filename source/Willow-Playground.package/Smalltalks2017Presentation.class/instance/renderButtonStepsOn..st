private - Rendering
renderButtonStepsOn: canvas

	canvas
		listItem: [ canvas render: 'Button'.
			canvas orderedList
				type: 'a';
				with: [ canvas
						listItem: 'Sin interacción';
						listItem: 'Execute on client (Alert)';
						listItem: 'Evaluate (Halt/Inspect)';
						listItem: 'Render (cambiar contenido de otro componente' ] ]