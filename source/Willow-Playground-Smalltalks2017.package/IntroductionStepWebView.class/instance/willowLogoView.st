private-accessing
willowLogoView

	^ ImageWebView
		locatedAt: Smalltalks2017FileMetadataLibrary / #willowlogoSvg
		applying: [ :image | image setStyleTo: [ :style | style width: 128 px ] ]