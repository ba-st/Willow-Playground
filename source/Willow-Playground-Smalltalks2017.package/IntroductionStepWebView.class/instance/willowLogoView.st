private-accessing
willowLogoView

	^ ImageWebView
		locatedAt: Smalltalks2017FileMetadataLibrary / #willowlogoPng
		applying: [ :image | image setStyleTo: [ :style | style width: 48 px ] ]