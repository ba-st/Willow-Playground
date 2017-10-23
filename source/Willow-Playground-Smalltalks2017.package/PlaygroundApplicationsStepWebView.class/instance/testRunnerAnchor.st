private-accessing
testRunnerAnchor

	^ self componentSupplier
		asynchronicAnchorLabeled: 'Open the Test Runner!'
		applying: (OpenNewLocationCommand navigatingTo: WPTestRunner handlerName)