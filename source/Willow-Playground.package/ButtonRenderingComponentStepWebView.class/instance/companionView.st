private-accessing
companionView

	^ IdentifiedWebView
		forSpanNamed: 'Companion'
		containing: [ :canvas | canvas render: self currentTime ]