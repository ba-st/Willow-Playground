rendering
renderContentOn: html

	html
		render:
			(self componentSupplier
				fieldSetContaining:
					(self componentSupplier gridBuilder
						addContent:
							(self componentSupplier
								delayedViewShowing: SpinKitCircle new
								whileEvaluating: [ packagesListBox allowAnyOf: self session applicationContext availablePackageCategories ]
								thenRendering: (self labeledViewDisplaying: 'Package Categories' boundTo: packagesListBox));
						addContent: identifiedTestCaseClassesSelection;
						build)
				applying: [  ]
				withLegend: 'Test Case Selection'
				applying: [  ])