private-rendering
renderFormContaining: input submittedBy: button on: aCanvas

	aCanvas form
		doNotSubmit;
		with: [ input identifyIn: aCanvas.
			aCanvas
				span: 'Enter a question';
				render: input;
				render: button ]