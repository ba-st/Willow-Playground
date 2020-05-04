"
I'm a web view responsible for selecting the current scope (class or trait to navigate)
"
Class {
	#name : #WPLiveDocumentationScopeSelectionWebView,
	#superclass : #WAPainter,
	#instVars : [
		'identifiedBehaviorSelection',
		'behaviorsListBox',
		'packagesDropdown'
	],
	#category : #'Willow-Playground-LiveDocs-WebViews'
}

{ #category : #initialization }
WPLiveDocumentationScopeSelectionWebView >> initialize [

	super initialize.
	self
		initializeIdentifiedBehaviorSelection;
		initializePackagesDropdown;
		initializeBehaviorsListBox
]

{ #category : #initialization }
WPLiveDocumentationScopeSelectionWebView >> initializeBehaviorsListBox [

	behaviorsListBox := self componentSupplier
		singleSelectionListBoxDisplayingAtOnce: 30
		applying: [ :listBox | listBox labelItemsWith: [ :class | class name ] ].
	behaviorsListBox onTrigger
		evaluate: [ behaviorsListBox
				withCurrentSelectionDo: [ :selectedClass | self session applicationContext setSelectedBehaviorTo: selectedClass ]
			]
]

{ #category : #initialization }
WPLiveDocumentationScopeSelectionWebView >> initializeIdentifiedBehaviorSelection [

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
WPLiveDocumentationScopeSelectionWebView >> initializePackagesDropdown [

	packagesDropdown := self componentSupplier
		dropdownListApplying:
			[ :dropdown | ( dropdown labelItemsWith: [ :package | package name ] ) + BootstrapSelectLiveSearchCommand default ].
	packagesDropdown onTrigger
		evaluate: [ packagesDropdown
				withCurrentSelectionDo: [ :selectedPackage | self session applicationContext setSelectedPackageTo: selectedPackage ]
			];
		render: identifiedBehaviorSelection
]

{ #category : #private }
WPLiveDocumentationScopeSelectionWebView >> labeledViewDisplaying: aLabel boundTo: aField [

	^ self componentSupplier
		labeledFieldApplying: [  ]
		displaying: aLabel
		applying: [ :label | label addClass bootstrap screenReaderOnly ]
		boundTo: aField
		applying: [  ]
]

{ #category : #configuring }
WPLiveDocumentationScopeSelectionWebView >> onBehaviorSelectedTrigger [

	^ behaviorsListBox onTrigger 
]

{ #category : #rendering }
WPLiveDocumentationScopeSelectionWebView >> renderContentOn: html [

	html
		render:
			( self componentSupplier gridBuilder
				columnsPerRow: 1;
				addContent:
					( self componentSupplier
						fieldSetContaining:
							( self componentSupplier
								delayedViewShowing: SpinKitCircle new
								whileEvaluating: [ packagesDropdown allowAnyOf: self session applicationContext availablePackages ]
								thenRendering: packagesDropdown )
						applying: [  ]
						withLegend: 'Packages'
						applying: [  ] );
				addContent: [ :canvas | canvas horizontalRule ];
				addContent:
					( self componentSupplier
						fieldSetContaining: identifiedBehaviorSelection
						applying: [  ]
						withLegend: 'Classes & Traits'
						applying: [  ] );
				build )
]
