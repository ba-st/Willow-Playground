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
								with:
									(self componentSupplier
										delayedViewShowing: SpinKitCircle new
										whileEvaluating: [ packagesListBox allowAnyOf: self session applicationContext availablePackageCategories ]
										thenRendering: (self labeledViewDisplaying: 'Package Categories' boundTo: packagesListBox)).
							canvas div
								class: (BootstrapCssStyles columnMedium: 6);
								with: identifiedTestCaseClassesSelection ] ]
				applying: [  ]
				withLegend: 'Test Case Selection'
				applying: [  ])