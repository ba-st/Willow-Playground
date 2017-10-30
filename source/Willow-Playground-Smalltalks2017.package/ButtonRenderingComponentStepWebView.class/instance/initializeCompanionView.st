initialization
initializeCompanionView
	companionView := IdentifiedWebView
		forSpanNamed: 'Companion'
		containing: [ :canvas | canvas strong: self currentTime ]