private-accessing
liveDocumentationAnchor

	^ self componentSupplier
		asynchronicAnchorLabeled: 'Open the Live Documentation!'
		applying: (OpenNewLocationCommand navigatingTo: WPLiveDocumentation handlerName)