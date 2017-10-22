private-rendering
renderSlidesForAll: aRenderableCollection on: aCanvas

	aRenderableCollection
		doWithIndex: [ :renderable :index | 
			| component |

			component := aCanvas div.
			component class: 'item'.
			renderable = aRenderableCollection first
				ifTrue: [ component class: BootstrapCssStyles active ].
			component with: renderable ]