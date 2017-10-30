rendering
renderContentOn: aCanvas

	self
		renderPanelWrapping: [ self renderSourceOf: #codeToRenderStringOn: on: aCanvas.
			self renderSourceOf: #codeToRenderBlock:on: on: aCanvas.
			self renderSourceOf: #codeToRenderComponent:on: on: aCanvas ]
		on: aCanvas