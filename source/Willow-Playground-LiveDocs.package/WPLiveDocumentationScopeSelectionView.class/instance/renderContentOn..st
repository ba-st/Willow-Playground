rendering
renderContentOn: html

	html
		render:
			(self componentSupplier gridBuilder
				columnsPerRow: 1;
				addContent:
					(self componentSupplier
						fieldSetContaining: (self componentSupplier delayedViewShowing: SpinKitCircle new whileEvaluating: [ packagesListBox allowAnyOf: self session applicationContext availablePackages ] thenRendering: packagesListBox)
						applying: [  ]
						withLegend: 'Packages'
						applying: [  ]);
				addContent:
					(self componentSupplier
						fieldSetContaining: identifiedBehaviorSelection
						applying: [  ]
						withLegend: '-'
						applying: [  ]);
				buildApplying: [  ])