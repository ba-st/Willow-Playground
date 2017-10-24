uploaded metadata
GitHubMark32pxPng
	^ WAFileLibraryResource
		filepath: 'GitHub-Mark-32px.png'
		mimeType: (WAMimeType main: 'image' sub: 'png')
		cacheDuration: (Duration days: 0 hours: 0 minutes: 30 seconds: 0)
		contents: (GRDelayedSend receiver: self selector: #GitHubMark32pxPngContent)