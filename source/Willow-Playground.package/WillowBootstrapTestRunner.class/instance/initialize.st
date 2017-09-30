initialization
initialize

	super initialize.
	self initializeComponentSupplier.
	contentView := GenericContainerWebView wrapping: [ :canvas |  ] applying: CompositeComponentCommand empty