private-accessing
projectsWithLocations

	^ Array
		with:
			{'Willow'.
			'Core features, components and commands'.
			self stableLabel.
			'ba-st/Willow'}
		with:
			{'Willow-Bootstrap'.
			'Bootstrap 3 components and plugins'.
			self stableLabel.
			'ba-st/Willow-Bootstrap'}
		with:
			{'Willow-JQueryUI'.
			'JQueryUI components'.
			self stableLabel.
			'ba-st/Willow-JQueryUI'}
		with:
			{'Willow-SemanticUI'.
			'SemanticUI components'.
			self workInProgressLabel.
			'ba-st/Willow-SemanticUI'}
		with:
			{'Willow-SpinKit'.
			'Spinner components (SpinKit)'.
			self stableLabel.
			'ba-st/Willow-SpinKit'}
		with:
			{'Willow-Playground'.
			'This presentation, Test Runner and Live Docs applications'.
			self stableLabel.
			'ba-st/Willow-Playground'}