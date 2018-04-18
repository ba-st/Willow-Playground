"
I'm a web view responsible for selecting the current scope (class or trait to navigate)
"
Class {
	#name : #WPLiveDocumentationScopeSelectionView,
	#superclass : #WAPainter,
	#instVars : [
		'identifiedBehaviorSelection',
		'behaviorsListBox',
		'packagesDropdown'
	],
	#category : 'Willow-Playground-LiveDocs'
}

{ #category : #initialization }
WPLiveDocumentationScopeSelectionView >> initialize [

	super initialize.
	self
		initializeIdentifiedBehaviorSelection;
		initializePackagesDropdown;
		initializeBehaviorsListBox
]

{ #category : #initialization }
WPLiveDocumentationScopeSelectionView >> initializeBehaviorsListBox [

	behaviorsListBox := self componentSupplier singleSelectionListBoxDisplayingAtOnce: 30 applying: [ :listBox | listBox labelItemsWith: [ :class | class name ] ].
	behaviorsListBox onTrigger
		serializeIt;
		evaluate: [ behaviorsListBox withCurrentSelectionDo: [ :selectedClass | self session applicationContext setSelectedBehaviorTo: selectedClass ] ]
]

{ #category : #initialization }
WPLiveDocumentationScopeSelectionView >> initializeIdentifiedBehaviorSelection [

	identifiedBehaviorSelection := IdentifiedWebView
		forDivNamed: 'behavior-selection'
		containing: [ :canvas | 
			canvas
				render:
					(self componentSupplier
						delayedViewShowing: SpinKitCircle new
						whileEvaluating: [ behaviorsListBox allowAnyOf: self session applicationContext availableBehaviors ]
						thenRendering: (self labeledViewDisplaying: 'Classes & Traits' boundTo: behaviorsListBox)) ]
]

{ #category : #initialization }
WPLiveDocumentationScopeSelectionView >> initializePackagesDropdown [

	packagesDropdown := self componentSupplier dropdownListApplying: [ :dropdown | (dropdown labelItemsWith: [ :package | package name ]) + BootstrapSelectLiveSearchCommand default ].
	packagesDropdown onTrigger
		serializeIt;
		evaluate: [ packagesDropdown withCurrentSelectionDo: [ :selectedPackage | self session applicationContext setSelectedPackageTo: selectedPackage ] ];
		render: identifiedBehaviorSelection
]

{ #category : #private }
WPLiveDocumentationScopeSelectionView >> labeledViewDisplaying: aLabel boundTo: aField [

	^ BootstrapLabeledWebView
		displaying: aLabel
		applying: [ :label | label addClass bootstrap screenReaderOnly ]
		boundTo: aField
		applying: [  ]
]

{ #category : #configuring }
WPLiveDocumentationScopeSelectionView >> onBehaviorSelectedTrigger [

	^ behaviorsListBox onTrigger 
]

{ #category : #rendering }
WPLiveDocumentationScopeSelectionView >> renderContentOn: html [

	html
		render:
			(self componentSupplier gridBuilder
				columnsPerRow: 1;
				addContent:
					(self componentSupplier
						fieldSetContaining: (self componentSupplier delayedViewShowing: SpinKitCircle new whileEvaluating: [ packagesDropdown allowAnyOf: self session applicationContext availablePackages ] thenRendering: packagesDropdown)
						applying: [  ]
						withLegend: 'Packages'
						applying: [  ]);
				addContent: [ :canvas | canvas horizontalRule ];
				addContent:
					(self componentSupplier
						fieldSetContaining: identifiedBehaviorSelection
						applying: [  ]
						withLegend: 'Classes & Traits'
						applying: [  ]);
				buildApplying: [  ])
]
