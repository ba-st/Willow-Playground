private-accessing
screenshotFor: aSelector

	^ ImageWebView
		locatedAt: Smalltalks2017FileMetadataLibrary / aSelector
		applying: [ :theImage | theImage addClass smalltalks2017 screenshot ]