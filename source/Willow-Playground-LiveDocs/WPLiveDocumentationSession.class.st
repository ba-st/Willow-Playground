"
I'm a Live Documentation session
"
Class {
	#name : #WPLiveDocumentationSession,
	#superclass : #WillowSession,
	#instVars : [
		'applicationContext'
	],
	#category : #'Willow-Playground-LiveDocs-Application'
}

{ #category : #accessing }
WPLiveDocumentationSession >> applicationContext [

	^ applicationContext
]

{ #category : #Controlling }
WPLiveDocumentationSession >> startUpApplicationContextFor: liveDocumenationApp [

	super startUpApplicationContextFor: liveDocumenationApp.
	applicationContext := WPLiveDocumentationContext new
]
