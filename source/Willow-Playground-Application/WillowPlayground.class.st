Class {
	#name : 'WillowPlayground',
	#superclass : 'LaunchpadApplication',
	#instVars : [
		'stackTraceDumper'
	],
	#classVars : [
		'Version'
	],
	#category : 'Willow-Playground-Application',
	#package : 'Willow-Playground-Application'
}

{ #category : 'accessing' }
WillowPlayground class >> commandName [

	^ 'playground'
]

{ #category : 'accessing' }
WillowPlayground class >> configurationParameters [

	^ { OptionalConfigurationParameter
		   named: 'Port'
		   describedBy: 'Listening port'
		   defaultingTo: 8080
		   convertingWith: #asNumber }
]

{ #category : 'accessing' }
WillowPlayground class >> description [

	^ 'The Willow Playground'
]

{ #category : 'class initialization' }
WillowPlayground class >> initialize [

  <ignoreForCoverage>
  self version: ( VersionFromRepositoryResolver new valueFor: 'Willow-Playground' )
]

{ #category : 'accessing' }
WillowPlayground class >> version [

	^ Version
]

{ #category : 'accessing' }
WillowPlayground class >> version: aVersion [

	Version := aVersion
]

{ #category : 'private - activation/deactivation' }
WillowPlayground >> basicStartWithin: context [

  LogRecord emitInfo: 'Registering web applications'.
  Smalltalks2017Presentation registerAsDeployedApplication.
  WPB3TestRunner registerAsDeployedApplication.
  WPB4TestRunner registerAsDeployedApplication.
  WPLiveDocumentation registerAsDeployedApplication.
  LogRecord emitInfo: 'Starting HTTP web server'.
  ( ZnZincServerAdaptor port: self configuration port )
    codec: ( GRCodec forEncoding: 'utf8' );
    start
]

{ #category : 'initialization' }
WillowPlayground >> initializeRunningIn: anApplicationMode configuredBy: aConfigurationProvider controlledBy: aCommandServer [

	super
		initializeRunningIn: anApplicationMode
		configuredBy: aConfigurationProvider
		controlledBy: aCommandServer.
	stackTraceDumper := self newStackTraceDumperOnStandardError
]

{ #category : 'error handling' }
WillowPlayground >> stackTraceDumper [

	^ stackTraceDumper
]
