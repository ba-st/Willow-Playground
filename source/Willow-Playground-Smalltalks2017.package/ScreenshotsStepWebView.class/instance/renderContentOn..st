rendering
renderContentOn: aCanvas

	self
		renderCarouselWithAll:
			{self eraForRolemasterScreenshot.
			self abbacoScreenshot.
			self tradingRoomScreenshot.
			self orderManagementScreenshot.
			self portfolioScreenshot}
		on: aCanvas