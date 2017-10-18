rendering
renderContentOn: html

	html
		render:
			(self componentSupplier gridBuilder
				columnsPerRow: 1;
				addContent:
					(self componentSupplier
						fieldSetContaining: (self componentSupplier delayedViewShowing: SpinKitCircle new whileEvaluating: [ packagesDropdown allowAnyOf: self session applicationContext availablePackages ] thenRendering: packagesDropdown)
						applying: [  ]
						withLegend: 'Packages'
						applying: [  ]);
				addContent: [ :canvas | canvas horizontalRule ];
				addContent:
					(self componentSupplier
						fieldSetContaining: identifiedBehaviorSelection
						applying: [  ]
						withLegend: 'Classes & Traits'
						applying: [  ]);
				buildApplying: [  ])