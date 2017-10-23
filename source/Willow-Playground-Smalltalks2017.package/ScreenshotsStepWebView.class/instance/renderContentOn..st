rendering
renderContentOn: aCanvas

	self
		renderCarouselWithAll:
			(Array
				with: (self screenshotFor: #eraJpg)
				with: (self screenshotFor: #bortJpg)
				with: (self screenshotFor: #tradingRoomJpg))
		on: aCanvas