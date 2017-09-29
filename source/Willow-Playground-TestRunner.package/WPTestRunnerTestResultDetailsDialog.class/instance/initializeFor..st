initialization
initializeFor: aTestResult

	dialog := BootstrapModalWebView
		withHeader: (BootstrapModalHeaderWebView dismissableTitled: 'Test Result Details')
		content: [ :canvas | self renderDetailsFor: aTestResult on: canvas ]
		footer: (BootstrapModalFooterWebView withCloseButtonLabeled: 'Close' applying: [ :button | button addClass bootstrap buttonLink ])
		applyingToDialog: BootstrapSelfCleaningModalCommand new
		andModalDocument: [  ]