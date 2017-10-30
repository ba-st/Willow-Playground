uploaded metadata
portfolioPng

	^ WAFileLibraryResource
		filepath: 'portfolio.png'
		mimeType: WAMimeType imagePng
		cacheDuration: self class defaultCacheDuration
		contents: (GRDelayedSend receiver: self selector: #portfolioPngContent)