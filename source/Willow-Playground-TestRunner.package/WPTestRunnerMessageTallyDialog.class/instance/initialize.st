initialization
initialize

	super initialize.
	dialog := BootstrapModalWebView
		withHeader: (BootstrapModalHeaderWebView dismissableTitled: 'Message Tally Result')
		content: [ :canvas | self session applicationContext withMessageTallyDo: [ :tally | canvas render: (WPMessageTallyWebView for: tally) ] ifNone: [ canvas render: 'Nothing here!' ] ]
		footer: (BootstrapModalFooterWebView withCloseButtonLabeled: 'Close' applying: [ :button | button addClass bootstrap buttonLink ])
		applyingToDialog: BootstrapSelfCleaningModalCommand new
		andModalDocument: [ :document | document addClass bootstrap modalLarge ]