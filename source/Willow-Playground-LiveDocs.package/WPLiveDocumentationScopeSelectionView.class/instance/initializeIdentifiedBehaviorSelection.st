initialization
initializeIdentifiedBehaviorSelection

	identifiedBehaviorSelection := IdentifiedWebView
		forDivNamed: 'behavior-selection'
		containing: [ :canvas | 
			canvas
				render:
					(self componentSupplier
						delayedViewShowing: SpinKitCircle new
						whileEvaluating: [ classesListBox allowAnyOf: self session applicationContext availableClasses ]
						thenRendering: (self labeledViewDisplaying: 'Classes' boundTo: classesListBox));
				render:
					(self componentSupplier
						delayedViewShowing: SpinKitCircle new
						whileEvaluating: [ traitsListBox allowAnyOf: self session applicationContext availableTraits ]
						thenRendering: (self labeledViewDisplaying: 'Traits' boundTo: traitsListBox)) ]