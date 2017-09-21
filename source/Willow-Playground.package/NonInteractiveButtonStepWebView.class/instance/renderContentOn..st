rendering
renderContentOn: aCanvas

	aCanvas render: (self componentSupplier asynchronicButtonLabeled: 'Do not click' applying: CompositeComponentCommand empty)