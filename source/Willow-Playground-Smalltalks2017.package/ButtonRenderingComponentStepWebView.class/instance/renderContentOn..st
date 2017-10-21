rendering
renderContentOn: aCanvas

	self renderSourceOf: #initializeCompanionView withBrowseButtonOn: aCanvas.
	self renderSourceOf: #initializeButton withBrowseButtonOn: aCanvas.

	self
		renderPanelWrapping: [ :canvas | 
			canvas div
				class: (BootstrapCssStyles columnMedium: 6);
				with: button.
			canvas div
				class: (BootstrapCssStyles columnMedium: 6);
				with: companionView ]
		on: aCanvas