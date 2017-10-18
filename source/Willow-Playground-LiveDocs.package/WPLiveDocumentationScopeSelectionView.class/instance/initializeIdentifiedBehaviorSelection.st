initialization
initializeIdentifiedBehaviorSelection

	identifiedBehaviorSelection := IdentifiedWebView
		forDivNamed: 'behavior-selection'
		containing: [ :canvas | 
			canvas
				render:
					(self componentSupplier
						delayedViewShowing: SpinKitCircle new
						whileEvaluating: [ behaviorsListBox allowAnyOf: self session applicationContext availableBehaviors ]
						thenRendering: (self labeledViewDisplaying: 'Classes & Traits' boundTo: behaviorsListBox)) ]