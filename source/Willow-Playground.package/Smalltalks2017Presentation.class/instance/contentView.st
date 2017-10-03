accessing
contentView

	^ [ :canvas | 
	canvas render: currentStepView.

	canvas break.
	canvas render: 'Welcome to the introduction to Willow'.
	canvas orderedList
		type: 'I';
		with: [ self renderGitHubStepsOn: canvas ] ]