private-rendering
renderCodeCarouselWithAll: aRenderableCollection on: aCanvas

	aCanvas render: (self browseStepButtonEvaluating: [ self browse ]).
	self renderCarouselWithAll: aRenderableCollection on: aCanvas