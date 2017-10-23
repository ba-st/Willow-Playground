rendering
renderContentOn: aCanvas

	self
		renderPanelWrapping: [ :canvas | 
			canvas
				paragraph: self testRunnerAnchor;
				paragraph: self liveDocumentationAnchor ]
		on: aCanvas