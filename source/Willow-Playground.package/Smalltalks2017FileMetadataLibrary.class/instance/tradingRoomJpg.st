private
tradingRoomJpg

	^ WAFileLibraryResource
		filepath: 'tradingRoom.jpg'
		mimeType: WAMimeType imageJpeg
		cacheDuration: self class defaultCacheDuration
		contents: (GRDelayedSend receiver: self selector: #tradingRoomJpgContent)