uploaded metadata
willowlogoSvg
	^ WAFileLibraryResource
		filepath: 'willow-logo.svg'
		mimeType: (WAMimeType main: 'image' sub: 'svg+xml')
		cacheDuration: self class defaultCacheDuration
		contents: (GRDelayedSend receiver: self selector: #willowlogoSvgContent)