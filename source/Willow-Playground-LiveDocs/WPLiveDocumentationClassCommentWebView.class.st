"
I'm responsible of showing the class comment if available
"
Class {
	#name : #WPLiveDocumentationClassCommentWebView,
	#superclass : #WAPainter,
	#instVars : [
		'selectedClass'
	],
	#category : #'Willow-Playground-LiveDocs-WebViews'
}

{ #category : #'instance creation' }
WPLiveDocumentationClassCommentWebView class >> for: aClass [

	^ self new initializeFor: aClass
]

{ #category : #initialization }
WPLiveDocumentationClassCommentWebView >> initializeFor: aClass [

	selectedClass := aClass
]

{ #category : #rendering }
WPLiveDocumentationClassCommentWebView >> renderContentOn: html [

	selectedClass hasComment
		ifTrue: [ html blockquote: [ selectedClass comment lines do: [ :line | html render: line ] separatedBy: [ html break ] ] ]
]
