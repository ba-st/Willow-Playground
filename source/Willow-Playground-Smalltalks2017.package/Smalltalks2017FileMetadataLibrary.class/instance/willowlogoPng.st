private
willowlogoPng

	^ WAFileLibraryResource
		filepath: 'willow-logo.png'
		mimeType: WAMimeType imagePng
		cacheDuration: self class defaultCacheDuration
		contents: (GRDelayedSend receiver: self selector: #willowlogoPngContent)