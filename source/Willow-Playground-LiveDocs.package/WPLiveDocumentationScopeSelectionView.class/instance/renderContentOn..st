rendering
renderContentOn: html

	html
		render:
			(self componentSupplier gridBuilder
				columnsPerRow: 1;
				addContent:
					(self componentSupplier
						fieldSetContaining: (self componentSupplier delayedViewShowing: SpinKitCircle new whileEvaluating: [ packagesListBox allowAnyOf: self session applicationContext availablePackages ] thenRendering: packagesListBox)
						applying: [ :fieldSet | fieldSet setStyleTo: [ :style | style height: 30 vh ] ]
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