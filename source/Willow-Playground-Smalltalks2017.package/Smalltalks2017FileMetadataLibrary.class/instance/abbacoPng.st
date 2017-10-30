uploaded metadata
abbacoPng
	^ WAFileLibraryResource
		filepath: 'abbaco.png'
		mimeType: (WAMimeType main: 'image' sub: 'png')
		cacheDuration: self class defaultCacheDuration 
		contents: (GRDelayedSend receiver: self selector: #abbacoPngContent)