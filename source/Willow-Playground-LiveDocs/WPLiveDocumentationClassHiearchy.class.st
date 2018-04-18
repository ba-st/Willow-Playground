"
I'm a panel showing the class hierarchy
"
Class {
	#name : #WPLiveDocumentationClassHiearchy,
	#superclass : #WAPainter,
	#instVars : [
		'selectedClass'
	],
	#category : 'Willow-Playground-LiveDocs'
}

{ #category : #'instance creation' }
WPLiveDocumentationClassHiearchy class >> for: aClass [

	^ self new initializeFor: aClass
]

{ #category : #initialization }
WPLiveDocumentationClassHiearchy >> initializeFor: aClass [

	selectedClass := aClass
]

{ #category : #initialization }
WPLiveDocumentationClassHiearchy >> renderContentOn: html [

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
