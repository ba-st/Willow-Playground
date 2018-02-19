private-accessing
testRunnerAnchor

	^ self componentSupplier
		asynchronicLinkLabeled: 'Open the Test Runner!'
		applying: (OpenLocationCommand forNewBrowsingContextNavigatingTo:WPTestRunner handlerName)