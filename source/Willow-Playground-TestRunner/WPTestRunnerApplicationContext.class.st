"
I'm holding the current test runner state and coordinate the transitions
"
Class {
	#name : #WPTestRunnerApplicationContext,
	#superclass : #GRObject,
	#instVars : [
		'currentTestResult',
		'selectedTestCaseClasses',
		'selectedPackageCategories',
		'messageTallyOptional'
	],
	#category : 'Willow-Playground-TestRunner'
}

{ #category : #Querying }
WPTestRunnerApplicationContext >> availablePackageCategories [

	| categories |

	categories := Set new.
	TestCase withAllSubclassesDo: [ :class | class category ifNotNil: [ :category | categories add: category ] ].
	^ categories sorted
]

{ #category : #Querying }
WPTestRunnerApplicationContext >> availableTestCaseClasses [

	| testCaseClasses |

	testCaseClasses := Set new.
	TestCase
		withAllSubclassesDo: [ :class | 
			(selectedPackageCategories includes: class category)
				ifTrue: [ testCaseClasses add: class ] ].
	^ testCaseClasses sorted: [ :a :b | a name <= b name ]
]

{ #category : #Accessing }
WPTestRunnerApplicationContext >> currentTestResult [

	^ currentTestResult
]

{ #category : #initialization }
WPTestRunnerApplicationContext >> initialize [

	super initialize.
	self resetTestResult.
	selectedTestCaseClasses := #().
	selectedPackageCategories := #().
	messageTallyOptional := Optional unused
]

{ #category : #initialization }
WPTestRunnerApplicationContext >> resetTestResult [

	currentTestResult := TestAsserter classForTestResult new
]

{ #category : #private }
WPTestRunnerApplicationContext >> runTestSuites: testSuites [

	CurrentExecutionEnvironment runTestsBy: [ testSuites do: [ :suite | suite run: currentTestResult ] ]
]

{ #category : #Actions }
WPTestRunnerApplicationContext >> runTests [

	self
		resetTestResult;
		runTestSuites: (selectedTestCaseClasses select: [ :class | class isAbstract not ] thenCollect: [ :class | class suite ])
]

{ #category : #Actions }
WPTestRunnerApplicationContext >> runTestsProfiled [

	| messageTally |

	messageTally := MessageTally
		spyOn: [ self runTests ]
		reportOtherProcesses: false
		cutoff: 1
		openResultWindow: false
		closeAfter: false.

	messageTallyOptional := (messageTally tally strictlyPositive and: [ messageTally time strictlyPositive ])
		ifTrue: [ Optional containing: messageTally ]
		ifFalse: [ Optional unused ]
]

{ #category : #'State Tracking' }
WPTestRunnerApplicationContext >> setSelectedPackageCategoriesTo: categories [

	selectedPackageCategories := categories
]

{ #category : #'State Tracking' }
WPTestRunnerApplicationContext >> setSelectedTestCaseClassesTo: testCaseClasses [

	selectedTestCaseClasses := testCaseClasses
]

{ #category : #Accessing }
WPTestRunnerApplicationContext >> withMessageTallyDo: aFoundBlock ifNone: aNoneBlock [

	messageTallyOptional withContentDo: aFoundBlock ifUnused: aNoneBlock
]
