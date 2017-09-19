private - Rendering
renderDialogStepsOn: canvas

	canvas
		listItem: [ canvas render: 'Dialog'.
			canvas orderedList
				type: 'a';
				with: [ canvas
						listItem: 'Button abre diálogo';
						listItem: 'Input+button, deshabilita input, manda texto a Pharo, usa respuesta para abrir ventana' ] ]