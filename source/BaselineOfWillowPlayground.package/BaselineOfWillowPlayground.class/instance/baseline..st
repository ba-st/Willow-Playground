baselines
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec
				package: 'Willow-Playground' with: [ spec requires: #('WillowBootstrap' 'WillowJQueryUI' 'WillowSpinKit') ];
				group: 'default' with: #('Willow-Playground') ]