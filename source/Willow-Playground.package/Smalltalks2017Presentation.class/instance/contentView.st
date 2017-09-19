Accessing
contentView

	^ [ :canvas | 
	canvas render: 'Welcome to the introduction to Willow'.
	canvas orderedList
		type: 'I';
		with: [ canvas
				listItem: 'Introduction: script para download + resumen visual de componentes'.
			self renderComponentStepsOn: canvas.
			self renderCommandsAndSupplierStepsOn: canvas.
			self renderTestRunnerStepsOn: canvas.
			self renderExampleStepsOn: canvas.
			self renderGitHubStepsOn: canvas ] ]