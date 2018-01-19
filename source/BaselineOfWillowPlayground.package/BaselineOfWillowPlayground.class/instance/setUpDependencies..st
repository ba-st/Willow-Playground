baselines
setUpDependencies: spec

	spec
		baseline: 'WillowBootstrap'
			with: [ spec
				repository: 'github://ba-st/Willow-Bootstrap:v4.0.1/source';
				loads: #('Deployment') ];
		import: 'WillowBootstrap'.

	spec
		baseline: 'WillowJQueryUI'
			with: [ spec
				repository: 'github://ba-st/Willow-JQueryUI:v4.0.1/source';
				loads: #('Deployment') ];
		import: 'WillowJQueryUI'.

	spec
		baseline: 'WillowSpinKit'
			with: [ spec
				repository: 'github://ba-st/Willow-SpinKit:v1.0.3/source';
				loads: #('Deployment') ];
		import: 'WillowSpinKit'
