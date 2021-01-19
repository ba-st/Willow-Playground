"
Baseline to load the Willow Playground
"
Class {
	#name : #BaselineOfWillowPlayground,
	#superclass : #BaselineOf,
	#category : #BaselineOfWillowPlayground
}

{ #category : #baselines }
BaselineOfWillowPlayground >> baseline: spec [

	<baseline>
	spec
		for: #pharo
		do: [ self
				setUpDependencies: spec;
				setUpPackages: spec.
			spec group: 'Development' with: 'Deployment'
			]
]

{ #category : #baselines }
BaselineOfWillowPlayground >> setUpDependencies: spec [

	spec
		baseline: 'WillowBootstrap'
			with: [ spec repository: 'github://ba-st/Willow-Bootstrap:v13/source' ];
		project: 'Willow-Bootstrap-Deployment'
			copyFrom: 'WillowBootstrap'
			with: [ spec loads: 'Deployment' ].

	spec
		baseline: 'WillowSpinKit' with: [ spec repository: 'github://ba-st/Willow-SpinKit:v9/source' ];
		project: 'Willow-SpinKit-Deployment' copyFrom: 'WillowSpinKit' with: [ spec loads: 'Deployment' ]
]

{ #category : #baselines }
BaselineOfWillowPlayground >> setUpPackages: spec [

	spec
		package: 'Willow-Playground-TestRunner'
			with: [ spec requires: #('Willow-Bootstrap-Deployment' 'Willow-SpinKit-Deployment') ];
		group: 'Deployment' with: 'Willow-Playground-TestRunner';
		package: 'Willow-Playground-LiveDocs'
			with: [ spec requires: #('Willow-Bootstrap-Deployment' 'Willow-SpinKit-Deployment') ];
		group: 'Deployment' with: 'Willow-Playground-LiveDocs';
		package: 'Willow-Playground-Smalltalks2017'
			with: [ spec requires: #('Willow-Playground-TestRunner' 'Willow-Playground-LiveDocs') ];
		group: 'Deployment' with: 'Willow-Playground-Smalltalks2017'
]
