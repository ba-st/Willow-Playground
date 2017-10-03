private
eraJpg

	^ WAFileLibraryResource
		filepath: 'era.jpg'
		mimeType: WAMimeType imageJpeg
		cacheDuration: self class defaultCacheDuration
		contents: (GRDelayedSend receiver: self selector: #eraJpgContent)