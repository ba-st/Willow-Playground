private-rendering
renderFormOn: aCanvas

	aCanvas form
		doNotSubmit;
		with: [ input identifyIn: aCanvas.
			self renderQuestionComponentsOn: aCanvas ]