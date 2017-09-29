rendering
renderContentOn: html

	html
		render:
			(self componentSupplier
				fieldSetContaining: [ :canvas | 
					canvas div
						class: BootstrapCssStyles row;
						with: [ canvas div
								class: (BootstrapCssStyles columnMedium: 6);
								with: packagesListBox.
							canvas div
								class: (BootstrapCssStyles columnMedium: 6);
								with: identifiedTestCaseClassesSelection ] ]
				applying: [  ]
				withLegend: 'Test Case Selection'
				applying: [  ])