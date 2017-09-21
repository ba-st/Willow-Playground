private - notes
renderCommandsAndSupplierStepsOn: canvas

	canvas
		listItem: [ canvas render: 'Comandos + Components + Supplier'.
			canvas orderedList
				type: '1';
				with: [ canvas
						listItem: 'Button con estilo';
						listItem: 'Resumen de comandos';
						listItem: 'Resumen de componentes (ejemplo DelayedWebView)';
						listItem: 'Supplier (Abstraction/Facade)' ] ]