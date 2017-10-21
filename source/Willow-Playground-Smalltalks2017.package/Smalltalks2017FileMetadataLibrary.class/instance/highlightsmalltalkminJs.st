private
highlightsmalltalkminJs

	^ WAFileLibraryResource
		filepath: 'highlight-smalltalk.min.js'
		mimeType: WAMimeType textJavascript
		cacheDuration: self class defaultCacheDuration
		contents: (GRDelayedSend receiver: self selector: #highlightsmalltalkminJsContent)