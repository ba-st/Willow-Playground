baselines
setUpDependencies: spec

	spec
		baseline: 'WillowBootstrap'
			with: [ spec
				repository: 'github://ba-st/Willow-Bootstrap:v6.0.0/source';
				loads: #('Deployment') ];
		import: 'WillowBootstrap'.

	spec
		baseline: 'WillowJQueryUI'
			with: [ spec
				repository: 'github://ba-st/Willow-JQueryUI:v5.0.0/source';
				loads: #('Deployment') ];
		import: 'WillowJQueryUI'.

	spec
		baseline: 'WillowSpinKit'
			with: [ spec
				repository: 'github://ba-st/Willow-SpinKit:v3.0.0/source';
				loads: #('Deployment') ];
		import: 'WillowSpinKit'
