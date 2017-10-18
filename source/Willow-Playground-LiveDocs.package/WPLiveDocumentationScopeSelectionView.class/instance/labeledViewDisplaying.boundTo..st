private
labeledViewDisplaying: aLabel boundTo: aField

	^ BootstrapLabeledWebView
		displaying: aLabel
		applying: [ :label | label addClass bootstrap screenReaderOnly ]
		boundTo: aField
		applying: [  ]