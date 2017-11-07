private-rendering
renderCarouselWithAll: aRenderableCollection on: aCanvas

	| carouselIdentifier |

	carouselIdentifier := 'theCarousel'.
	aCanvas div
		id: carouselIdentifier;
		class: 'carousel';
		class: 'slide';
		attributeAt: 'data-ride' put: 'carousel';
		script: ((aCanvas jQuery class: 'carousel') call: 'carousel' with: 'pause');
		with: [ self renderCarouselSlidesContainerForAll: aRenderableCollection on: aCanvas.
			self renderCarouselControlsIn: carouselIdentifier on: aCanvas ]