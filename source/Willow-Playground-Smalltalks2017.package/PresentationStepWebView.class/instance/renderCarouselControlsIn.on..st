private-rendering
renderCarouselControlsIn: carouselIdentifier on: aCanvas

	self
		renderCarouselControlIn: carouselIdentifier
		slidingTo: 'prev'
		anchorStyledWith: 'left'
		spanStyledWith: Glyphicons chevronLeft
		named: 'Previous'
		on: aCanvas.
	self
		renderCarouselControlIn: carouselIdentifier
		slidingTo: 'next'
		anchorStyledWith: 'right'
		spanStyledWith: Glyphicons chevronRight
		named: 'Next'
		on: aCanvas