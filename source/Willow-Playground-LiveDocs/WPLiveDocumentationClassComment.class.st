"
I'm responsible of showing the class comment if available
"
Class {
	#name : #WPLiveDocumentationClassComment,
	#superclass : #WAPainter,
	#instVars : [
		'selectedClass'
	],
	#category : 'Willow-Playground-LiveDocs'
}

{ #category : #'instance creation' }
WPLiveDocumentationClassComment class >> for: aClass [

	^ self new initializeFor: aClass
]

{ #category : #initialization }
WPLiveDocumentationClassComment >> initializeFor: aClass [

	selectedClass := aClass
]

{ #category : #rendering }
WPLiveDocumentationClassComment >> renderContentOn: html [

	selectedClass hasComment
		ifTrue: [ html blockquote: [ selectedClass comment lines do: [ :line | html render: line ] separatedBy: [ html break ] ] ]
]
