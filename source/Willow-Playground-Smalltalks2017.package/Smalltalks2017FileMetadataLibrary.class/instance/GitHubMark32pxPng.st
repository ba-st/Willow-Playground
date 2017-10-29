private
gitHubMark32pxPng

	^ WAFileLibraryResource
		filepath: 'gitHub-Mark-32px.png'
		mimeType: WAMimeType imagePng
		cacheDuration: self class defaultCacheDuration
		contents: (GRDelayedSend receiver: self selector: #gitHubMark32pxPngContent)