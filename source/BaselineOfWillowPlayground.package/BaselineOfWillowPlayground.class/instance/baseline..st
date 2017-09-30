baselines
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec
				package: 'Willow-Playground' with: [ spec requires: #('WillowBootstrap' 'WillowJQueryUI' 'WillowSpinKit') ];
				package: 'Willow-Playground-TestRunner' with: [ spec requires: #('WillowBootstrap' 'WillowJQueryUI' 'WillowSpinKit') ];
				group: 'default' with: #('Willow-Playground' 'Willow-Playground-TestRunner') ]