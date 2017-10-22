private-rendering
renderIndicatorsForAll: aRenderableCollection in: carouselIdentifier on: aCanvas

	aRenderableCollection
		doWithIndex: [ :renderable :index | 
			| item |

			item := aCanvas listItem.
			item
				attributeAt: 'data-target' put: ('#<1s>' expandMacrosWith: carouselIdentifier);
				attributeAt: 'data-slide-to' put: index - 1.
			renderable = aRenderableCollection first
				ifTrue: [ item class: BootstrapCssStyles active ] ]