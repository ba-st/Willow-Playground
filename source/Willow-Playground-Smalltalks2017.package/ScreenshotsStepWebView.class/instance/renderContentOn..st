rendering
renderContentOn: aCanvas

	| eraImage bortImage tradingRoomImage |

	eraImage := ImageWebView
		locatedAt: Smalltalks2017FileMetadataLibrary / #eraJpg
		applying: [ :theImage | theImage addClass smalltalks2017 screenshot ].
	bortImage := ImageWebView
		locatedAt: Smalltalks2017FileMetadataLibrary / #bortJpg
		applying: [ :theImage | theImage addClass smalltalks2017 screenshot ].
	tradingRoomImage := ImageWebView
		locatedAt: Smalltalks2017FileMetadataLibrary / #tradingRoomJpg
		applying: [ :theImage | theImage addClass smalltalks2017 screenshot ].

	aCanvas
		render: eraImage;
		render: bortImage;
		render: tradingRoomImage