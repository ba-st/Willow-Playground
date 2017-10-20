rendering
renderContentOn: aCanvas

	self renderSourceOf: #dropDownListView on: aCanvas.
	aCanvas render: self dropDownListView.
	self renderSourceOf: #checkboxView on: aCanvas.
	aCanvas render: self checkboxView.
	self renderSourceOf: #imageView on: aCanvas.
	aCanvas render: self imageView