private - rendering
renderStepButtonsOn: aCanvas

	aCanvas div
		class: Smalltalks2017CssStyles stepButtonContainer;
		with: [ currentStepIndex = 1
				ifFalse: [ aCanvas render: self previousStepButton ].

			currentStepIndex = stepViews size
				ifFalse: [ aCanvas render: self nextStepButton ] ]