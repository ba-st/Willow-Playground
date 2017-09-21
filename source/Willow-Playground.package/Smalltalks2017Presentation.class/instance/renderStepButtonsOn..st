private - rendering
renderStepButtonsOn: aCanvas

	aCanvas
		div: [ currentStepIndex = 1
				ifFalse: [ aCanvas render: self previousStepButton ].

			currentStepIndex = stepViews size
				ifFalse: [ aCanvas render: self nextStepButton ] ]