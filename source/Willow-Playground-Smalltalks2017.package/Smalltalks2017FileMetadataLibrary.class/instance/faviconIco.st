private
faviconIco

	^ WAFileLibraryResource
		filepath: 'favicon.ico'
		mimeType: (WAMimeType main: 'image' sub: 'x-icon')
		cacheDuration: self class defaultCacheDuration
		contents: (GRDelayedSend receiver: self selector: #faviconIcoContent)