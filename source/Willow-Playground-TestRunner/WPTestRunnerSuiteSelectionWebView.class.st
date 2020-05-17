"
I represent the test suite selection
"
Class {
	#name : #WPTestRunnerSuiteSelectionWebView,
	#superclass : #WAPainter,
	#instVars : [
		'testCaseClassesListBox',
		'identifiedTestCaseClassesSelection',
		'packagesListBox'
	],
	#category : #'Willow-Playground-TestRunner-Application'
}

{ #category : #initialization }
WPTestRunnerSuiteSelectionWebView >> initialize [

	super initialize.
	self
		initializeTestCaseClassesSelection;
		initializeIdentifiedTestCaseClassesSelection;
		initializePackageSelection
]

{ #category : #initialization }
WPTestRunnerSuiteSelectionWebView >> initializeIdentifiedTestCaseClassesSelection [

	identifiedTestCaseClassesSelection := IdentifiedWebView
		forDivNamed: 'test-case-selection'
		containing: [ :canvas | 
			canvas
				render:
					(self componentSupplier
						delayedViewShowing: SpinKitCircle new
						whileEvaluating: [ testCaseClassesListBox allowAnyOf: self session applicationContext availableTestCaseClasses ]
						thenRendering: (self labeledViewDisplaying: 'Test Cases' boundTo: testCaseClassesListBox)) ]
]

{ #category : #initialization }
WPTestRunnerSuiteSelectionWebView >> initializePackageSelection [

	packagesListBox := self componentSupplier
		multipleSelectionListBoxDisplayingAtOnce: 25
		applying: [  ].
	packagesListBox onTrigger
		evaluate: [ self session applicationContext setSelectedPackageCategoriesTo: packagesListBox currentSelection ];
		render: identifiedTestCaseClassesSelection
]

{ #category : #initialization }
WPTestRunnerSuiteSelectionWebView >> initializeTestCaseClassesSelection [

	testCaseClassesListBox := self componentSupplier
		multipleSelectionListBoxDisplayingAtOnce: 25
		applying: [  ].
	testCaseClassesListBox onTrigger
		evaluate: [ self session applicationContext
				setSelectedTestCaseClassesTo: testCaseClassesListBox currentSelection
			]
]

{ #category : #private }
WPTestRunnerSuiteSelectionWebView >> labeledViewDisplaying: aLabel boundTo: aField [

	^ self componentSupplier
		labeledFieldApplying: [  ]
		displaying: aLabel
		applying: [  ]
		boundTo: aField
		applying: [  ]
]

{ #category : #rendering }
WPTestRunnerSuiteSelectionWebView >> renderContentOn: html [

	html
		render:
			(self componentSupplier
				fieldSetContaining:
					(self componentSupplier gridBuilder
						addContent:
							(self componentSupplier
								delayedViewShowing: SpinKitCircle new
								whileEvaluating: [ packagesListBox allowAnyOf: self session applicationContext availablePackageCategories ]
								thenRendering: (self labeledViewDisplaying: 'Package Categories' boundTo: packagesListBox));
						addContent: identifiedTestCaseClassesSelection;
						build)
				applying: [  ]
				withLegend: 'Test Case Selection'
				applying: [  ])
]
