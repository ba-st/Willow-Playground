private
highlightthemesunburstCss

	^ WAFileLibraryResource
		filepath: 'highlight-theme-sunburst.css'
		mimeType: WAMimeType textCss
		cacheDuration: self class defaultCacheDuration
		contents: (GRDelayedSend receiver: self selector: #highlightthemesunburstCssContent)