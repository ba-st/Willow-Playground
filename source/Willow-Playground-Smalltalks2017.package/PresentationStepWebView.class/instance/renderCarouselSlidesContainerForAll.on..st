private-rendering
renderCarouselSlidesContainerForAll: aRenderableCollection on: aCanvas

	aCanvas div
		class: 'carousel-inner';
		attributeAt: 'role' put: 'listbox';
		with: [ self renderSlidesForAll: aRenderableCollection on: aCanvas ]