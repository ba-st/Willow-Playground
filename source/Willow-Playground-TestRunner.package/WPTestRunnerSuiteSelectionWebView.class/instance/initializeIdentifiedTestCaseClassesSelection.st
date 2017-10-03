initialization
initializeIdentifiedTestCaseClassesSelection

	identifiedTestCaseClassesSelection := IdentifiedWebView
		forDivNamed: 'test-case-selection'
		containing: [ :canvas | 
			canvas
				render:
					(self componentSupplier
						delayedViewShowing: SpinKitCircle new
						whileEvaluating: [ testCaseClassesListBox allowAnyOf: self session applicationContext availableTestCaseClasses ]
						thenRendering: (self labeledViewDisplaying: 'Test Cases' boundTo: testCaseClassesListBox)) ]