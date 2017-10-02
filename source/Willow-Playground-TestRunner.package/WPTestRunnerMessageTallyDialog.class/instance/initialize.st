initialization
initialize

	super initialize.
	dialog := BootstrapModalWebView
		withHeader: (BootstrapModalHeaderWebView dismissableTitled: 'Message Tally Result')
		content: [ :canvas | self renderTallyOn: canvas ]
		footer: (BootstrapModalFooterWebView withCloseButtonLabeled: 'Close' applying: [ :button | button addClass bootstrap buttonLink ])
		applyingToDialog: BootstrapSelfCleaningModalCommand new
		andModalDocument: [ :document | document addClass bootstrap modalLarge ]