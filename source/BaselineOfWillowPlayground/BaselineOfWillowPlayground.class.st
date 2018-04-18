"
Baseline to load the Willow Playground
"
Class {
	#name : #BaselineOfWillowPlayground,
	#superclass : #BaselineOf,
	#category : 'BaselineOfWillowPlayground'
}

{ #category : #baselines }
BaselineOfWillowPlayground >> baseline: spec [

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
]

{ #category : #baselines }
BaselineOfWillowPlayground >> setUpDependencies: spec [

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

]
