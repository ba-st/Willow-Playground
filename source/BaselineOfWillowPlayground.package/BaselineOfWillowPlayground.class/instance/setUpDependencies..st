baselines
setUpDependencies: spec

	spec
		baseline: 'WillowBootstrap'
			with: [ spec
				repository: 'github://ba-st/Willow-Bootstrap:master/source';
				loads: #('Deployment') ];
		import: 'WillowBootstrap'.

	spec
		baseline: 'WillowJQueryUI'
			with: [ spec
				repository: 'github://ba-st/Willow-JQueryUI:master/source';
				loads: #('Deployment') ];
		import: 'WillowJQueryUI'.

	spec
		baseline: 'WillowSpinKit'
			with: [ spec
				repository: 'github://ba-st/Willow-SpinKit:master/source';
				loads: #('Deployment') ];
		import: 'WillowSpinKit'