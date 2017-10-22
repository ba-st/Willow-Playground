private
smalltalk80bookJpg

	^ WAFileLibraryResource
		filepath: 'smalltalk80book.jpg'
		mimeType: WAMimeType imageJpeg
		cacheDuration: self class defaultCacheDuration
		contents: (GRDelayedSend receiver: self selector: #smalltalk80bookJpgContent)