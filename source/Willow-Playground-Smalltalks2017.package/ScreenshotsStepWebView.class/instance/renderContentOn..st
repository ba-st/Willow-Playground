rendering
renderContentOn: aCanvas

	self
		renderCarouselWithAll:
			(Array
				with: self eraForRolemasterScreenshot
				with: self abbacoScreenshot
				with: self tradingRoomScreenshot)
		on: aCanvas