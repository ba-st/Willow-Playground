private-accessing
liveDocumentationAnchor

	^ self componentSupplier asynchronicLinkLabeled: 'Open the Live Documentation!' applying: (OpenLocationCommand forNewBrowsingContextNavigatingTo: WPLiveDocumentation handlerName)