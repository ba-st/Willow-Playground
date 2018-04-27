"
I'm a panel showing the class hierarchy
"
Class {
	#name : #WPLiveDocumentationClassHierarchyCard,
	#superclass : #WAPainter,
	#instVars : [
		'selectedClass'
	],
	#category : #'Willow-Playground-LiveDocs-WebViews'
}

{ #category : #'instance creation' }
WPLiveDocumentationClassHierarchyCard class >> for: aClass [

	^ self new initializeFor: aClass
]

{ #category : #initialization }
WPLiveDocumentationClassHierarchyCard >> initializeFor: aClass [

	selectedClass := aClass
]

{ #category : #initialization }
WPLiveDocumentationClassHierarchyCard >> renderContentOn: html [

	html
		render:
			(self componentSupplier panelBuilder
				headingDisplaying: 'Hierarchy';
				wrapping: [ :canvas | 
					selectedClass withAllSuperclasses reverse
						doWithIndex: [ :class :index | 
							index - 1
								timesRepeat: [ canvas
										space;
										space ].
							canvas
								render: class name;
								break ] ];
				buildApplying: [ :panel | panel addClass bootstrap panelDefault ])
]
