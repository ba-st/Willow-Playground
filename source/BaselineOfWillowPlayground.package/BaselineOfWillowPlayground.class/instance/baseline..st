baselines
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec
				package: 'Willow-Playground-Smalltalks2017'
					with: [ spec requires: #('WillowBootstrap' 'WillowJQueryUI' 'WillowSpinKit') ];
				package: 'Willow-Playground-TestRunner'
					with: [ spec requires: #('WillowBootstrap' 'WillowJQueryUI' 'WillowSpinKit') ];
				package: 'Willow-Playground-LiveDocs'
					with: [ spec requires: #('WillowBootstrap' 'WillowSpinKit') ];
				group: 'default'
					with:
					#('Willow-Playground-Smalltalks2017' 'Willow-Playground-TestRunner' 'Willow-Playground-LiveDocs') ]