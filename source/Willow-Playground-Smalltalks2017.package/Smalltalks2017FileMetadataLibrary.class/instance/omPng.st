uploaded metadata
omPng
	^ WAFileLibraryResource
		filepath: 'om.png'
		mimeType: WAMimeType imagePng 
		cacheDuration: self class defaultCacheDuration
		contents: (GRDelayedSend receiver: self selector: #omPngContent)