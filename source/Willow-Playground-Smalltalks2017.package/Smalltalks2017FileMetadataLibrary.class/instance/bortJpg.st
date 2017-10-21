private
bortJpg

	^ WAFileLibraryResource
		filepath: 'bort.jpg'
		mimeType: WAMimeType imageJpeg
		cacheDuration: self class defaultCacheDuration
		contents: (GRDelayedSend receiver: self selector: #bortJpgContent)