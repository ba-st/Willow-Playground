"
I'm a session holding the context for the Test Runner
"
Class {
	#name : #WPTestRunnerSession,
	#superclass : #WillowSession,
	#instVars : [
		'applicationContext'
	],
	#category : #'Willow-Playground-TestRunner-Application'
}

{ #category : #accessing }
WPTestRunnerSession >> applicationContext [

	^ applicationContext
]

{ #category : #Controlling }
WPTestRunnerSession >> startUpApplicationContextFor: aTestRunner [

	super startUpApplicationContextFor: aTestRunner.
	applicationContext := WPTestRunnerApplicationContext new
]
