baselines
setUpDependencies: spec

	spec
		baseline: 'WillowBootstrap'
			with: [ spec
				repository: 'github://ba-st/Willow-Bootstrap:v7.0.0/source';
				loads: #('Deployment') ];
		import: 'WillowBootstrap'.

	spec
		baseline: 'WillowJQueryUI'
			with: [ spec
				repository: 'github://ba-st/Willow-JQueryUI:v6.0.0/source';
				loads: #('Deployment') ];
		import: 'WillowJQueryUI'.

	spec
		baseline: 'WillowSpinKit'
			with: [ spec
				repository: 'github://ba-st/Willow-SpinKit:v4.0.0/source';
				loads: #('Deployment') ];
		import: 'WillowSpinKit'
