private-rendering
renderCarouselWithAll: aRenderableCollection on: aCanvas

	| carouselIdentifier |

	carouselIdentifier := 'theCarousel'.
	aCanvas div
		id: carouselIdentifier;
		classes: (Array with: 'carousel' with: 'slide');
		attributeAt: 'data-ride' put: 'carousel';
		with: [ self renderCarouselSlidesContainerForAll: aRenderableCollection on: aCanvas.
			self renderCarouselControlsIn: carouselIdentifier on: aCanvas ]