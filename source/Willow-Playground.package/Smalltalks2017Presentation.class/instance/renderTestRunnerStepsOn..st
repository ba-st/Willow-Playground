private - notes
renderTestRunnerStepsOn: canvas

	canvas
		listItem: [ canvas render: 'Test Runner (JQuery UI , Bootstrap)'.
			canvas orderedList
				type: '1';
				with: [ canvas
						listItem: 'Interacción + Download results';
						listItem: 'Suppliers';
						listItem: 'Código' ] ]