# Installation

## Basic Installation

You can load **Willow-Playground** evaluating:
```smalltalk
Metacello new
	baseline: 'WillowPlayground';
	repository: 'github://ba-st/Willow-Playground:release-candidate/source';
	load.
```
>  Change `release-candidate` to some released version if you want a pinned version

## Using as dependency

In order to include **Willow-Playground** as part of your project, you should reference the package in your product baseline:

```smalltalk
setUpDependencies: spec

	spec
		baseline: 'WillowPlayground'
			with: [ spec
				repository: 'github://ba-st/Willow-Playground:v{XX}/source';
				loads: #('Deployment') ];
		import: 'WillowPlayground'.
```
> Replace `{XX}` with the version you want to depend on

```smalltalk
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec package: 'My-Package' with: [ spec requires: #('WillowPlayground') ] ]
```

## Provided groups

- `Deployment` will load all the packages needed in a deployed application
- `Development` will load all the needed packages to develop and contribute to the project
