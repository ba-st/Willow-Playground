"
I'm the application context. My intent is to hold the state of the application.
"
Class {
	#name : #WPLiveDocumentationContext,
	#superclass : #GRObject,
	#instVars : [
		'selectedPackageOptional',
		'selectedBehaviorOptional'
	],
	#category : #'Willow-Playground-LiveDocs-Application'
}

{ #category : #Querying }
WPLiveDocumentationContext >> availableBehaviors [

	^ (selectedPackageOptional withContentDo: [ :package | package definedClasses ] ifUnused: [ #() ]) sorted: [ :a :b | a name < b name ]
]

{ #category : #Querying }
WPLiveDocumentationContext >> availablePackages [

	^ RPackageOrganizer default packages sorted: [ :a :b | a name < b name ]
]

{ #category : #initialization }
WPLiveDocumentationContext >> initialize [

	super initialize.
	selectedPackageOptional := Optional unused.
	selectedBehaviorOptional := Optional unused
]

{ #category : #'State Management' }
WPLiveDocumentationContext >> setSelectedBehaviorTo: aBehavior [

	selectedBehaviorOptional := Optional containing: aBehavior
]

{ #category : #'State Management' }
WPLiveDocumentationContext >> setSelectedPackageTo: aPackage [

	selectedPackageOptional := Optional containing: aPackage
]

{ #category : #Querying }
WPLiveDocumentationContext >> withSelectedBehaviorDo: aBock ifNone: aNoneBlock [

	selectedBehaviorOptional withContentDo: aBock ifUnused: aNoneBlock
]
