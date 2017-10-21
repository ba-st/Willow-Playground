initialization
initializeCompanionView

	companionView := IdentifiedWebView
		forSpanNamed: 'Companion'
		containing: [ self currentTime ]