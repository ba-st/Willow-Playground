private-rendering
renderCarouselWithAll: aRenderableCollection on: aCanvas

	| carouselIdentifier |

	aCanvas render: self browseStepButton.
	carouselIdentifier := 'theCarousel'.
	aCanvas div
		id: carouselIdentifier;
		classes: (Array with: 'carousel' with: 'slide');
		attributeAt: 'data-ride' put: 'carousel';
		with: [ aCanvas orderedList
				class: 'carousel-indicators';
				with: [ self renderIndicatorsForAll: aRenderableCollection in: carouselIdentifier on: aCanvas ].
			aCanvas div
				class: 'carousel-inner';
				attributeAt: 'role' put: 'listbox';
				with: [ self renderSlidesForAll: aRenderableCollection on: aCanvas ] ]