private-rendering
renderFormOn: aCanvas

	aCanvas form
		doNotSubmit;
		with: [ input identifyIn: aCanvas.
			self
				render: 'Enter a question' asColumnOn: aCanvas;
				render: input asColumnOn: aCanvas;
				render: button asColumnOn: aCanvas ]