"
I'm a panel showing the class definition
"
Class {
	#name : #WPLiveDocumentationClassDefinitionCard,
	#superclass : #WAPainter,
	#instVars : [
		'selectedClass'
	],
	#category : #'Willow-Playground-LiveDocs-WebViews'
}

{ #category : #'instance creation' }
WPLiveDocumentationClassDefinitionCard class >> for: aClass [

	^ self new initializeFor: aClass
]

{ #category : #initialization }
WPLiveDocumentationClassDefinitionCard >> initializeFor: aClass [

	selectedClass := aClass
]

{ #category : #initialization }
WPLiveDocumentationClassDefinitionCard >> renderContentOn: html [

	html
		render:
			(self componentSupplier panelBuilder
				headingDisplaying: 'Definition';
				wrapping: [ :canvas | 
					canvas definitionList
						class: BootstrapCssStyles definitionListHorizontal;
						with: [ canvas
								definitionTerm: 'Superclass';
								definitionData: (selectedClass superclass ifNotNil: [ :superclass | superclass name ]);
								definitionTerm: 'Layout';
								definitionData: selectedClass classLayout class name;
								definitionTerm: 'Traits used';
								definitionData: selectedClass traitComposition;
								definitionTerm: 'Instance Variables';
								definitionData: [ selectedClass instVarNames do: [ :name | canvas render: name ] separatedBy: [ canvas break ] ];
								definitionTerm: 'Class Variables';
								definitionData: [ selectedClass classVarNames do: [ :name | canvas render: name ] separatedBy: [ canvas break ] ];
								definitionTerm: 'Pool Dictionaries';
								definitionData: [ selectedClass sharedPools do: [ :pool | canvas render: pool name ] separatedBy: [ canvas break ] ];
								definitionTerm: 'Category';
								definitionData: selectedClass category ] ];
				buildApplying: [ :panel | panel addClass bootstrap panelDefault ])
]