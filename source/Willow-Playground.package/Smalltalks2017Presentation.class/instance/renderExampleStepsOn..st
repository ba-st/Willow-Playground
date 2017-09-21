private - notes
renderExampleStepsOn: canvas

	canvas
		listItem: [ canvas render: 'Ejemplos'.
			canvas orderedList
				type: '1';
				with: [ canvas
						listItem: 'Mesa';
						listItem: 'BORT';
						listItem: 'ERA' ] ]