uploaded metadata
abbacoPng

	^ WAFileLibraryResource
		filepath: 'abbaco.png'
		mimeType: WAMimeType imagePng
		cacheDuration: self class defaultCacheDuration
		contents: (GRDelayedSend receiver: self selector: #abbacoPngContent)