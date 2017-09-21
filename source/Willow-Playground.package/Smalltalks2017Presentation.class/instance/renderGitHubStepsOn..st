private - notes
renderGitHubStepsOn: canvas

	canvas
		listItem: [ canvas render: 'GitHub'.
			canvas orderedList
				type: '1';
				with: [ canvas
						listItem: 'Datos de contacto';
						listItem: 'Proyectos';
						listItem: 'Tutorial y aplicación de esta presentacion y test runner';
						listItem: 'ErrorHandler' ] ]