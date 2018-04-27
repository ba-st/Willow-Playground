"
I show the test result details
"
Class {
	#name : #WPTestRunnerTestResultDetailsDialog,
	#superclass : #WAPainter,
	#instVars : [
		'dialog'
	],
	#category : #'Willow-Playground-TestRunner-WebViews'
}

{ #category : #'instance creation' }
WPTestRunnerTestResultDetailsDialog class >> for: aTestResult [

	^ self new initializeFor: aTestResult
]

{ #category : #initialization }
WPTestRunnerTestResultDetailsDialog >> initializeFor: aTestResult [

	dialog := self componentSupplier dialogBuilder
		headerTitled: 'Test Result Details';
		wrapping: [ :canvas | self renderDetailsFor: aTestResult on: canvas ];
		closeButtonLabeled: 'Close' applying: [ :button | button addClass bootstrap buttonLink ];
		beSelfCleaning;
		build
]

{ #category : #rendering }
WPTestRunnerTestResultDetailsDialog >> renderContentOn: html [

	html render: dialog
]

{ #category : #rendering }
WPTestRunnerTestResultDetailsDialog >> renderDetailsFor: aTestResult on: html [

	html render: (self summaryFor: aTestResult).
	self
		renderFailuresFor: aTestResult on: html;
		renderErrorsFor: aTestResult on: html
]

{ #category : #rendering }
WPTestRunnerTestResultDetailsDialog >> renderErrorsFor: aTestResult on: html [

	aTestResult hasErrors
		ifTrue: [ | errorsTable |

			html render: (HeadingWebView displaying: ('Errors (<1p>)' expandMacrosWith: aTestResult errorCount) withLevel: 4 applying: [ :heading | heading addClass bootstrap textDanger ]).

			errorsTable := self componentSupplier tableBuilder
				addColumnTitled: 'Class'
					rendering: [ :failure | failure class name ]
					applyingToCells: [  ]
					applyingToHeading: [ :headingCell | headingCell addClass bootstrap textDanger ];
				addColumnTitled: 'Selector'
					rendering: [ :failure | failure selector ]
					applyingToCells: [  ]
					applyingToHeading: [ :headingCell | headingCell addClass bootstrap textDanger ];
				build.
			errorsTable changeContentsTo: aTestResult errors.
			html render: errorsTable ]
]

{ #category : #rendering }
WPTestRunnerTestResultDetailsDialog >> renderFailuresFor: aTestResult on: html [

	aTestResult hasFailures
		ifTrue: [ | failuresTable |

			html render: (HeadingWebView displaying: ('Failures (<1p>)' expandMacrosWith: aTestResult failureCount) withLevel: 4 applying: [ :heading | heading addClass bootstrap textWarning ]).

			failuresTable := self componentSupplier tableBuilder
				addColumnTitled: 'Class'
					rendering: [ :failure | failure class name ]
					applyingToCells: [  ]
					applyingToHeading: [ :headingCell | headingCell addClass bootstrap textWarning ];
				addColumnTitled: 'Selector'
					rendering: [ :failure | failure selector ]
					applyingToCells: [  ]
					applyingToHeading: [ :headingCell | headingCell addClass bootstrap textWarning ];
				build.
			failuresTable changeContentsTo: aTestResult failures.
			html render: failuresTable ]
]

{ #category : #rendering }
WPTestRunnerTestResultDetailsDialog >> summaryFor: aTestResult [

	^ self componentSupplier gridBuilder
		columnsPerRow: 1;
		applyingToCells: [ :cell | cell addClass bootstrap textCenter ];
		addContent: [ :canvas | 
			canvas
				render: (HeadingWebView displaying: 'Summary' withLevel: 4 applying: [ :heading | heading addClass bootstrap textInfo + heading addClass bootstrap textLeft ]);
				render: (PhrasingContainerWebView wrapping: aTestResult runCount applying: [ :span | span addClass bootstrap label + span addClass bootstrap labelDefault ]);
				space;
				render: 'run';
				space;
				render: (PhrasingContainerWebView wrapping: aTestResult passedCount applying: [ :span | span addClass bootstrap label + span addClass bootstrap labelSuccess ]);
				space;
				render: 'passes';
				space;
				render: (PhrasingContainerWebView wrapping: aTestResult skippedCount applying: [ :span | span addClass bootstrap label + span addClass bootstrap labelInfo ]);
				space;
				render: 'skipped';
				space;
				render: (PhrasingContainerWebView wrapping: aTestResult failureCount applying: [ :span | span addClass bootstrap label + span addClass bootstrap labelWarning ]);
				space;
				render: 'failures';
				space;
				render: (PhrasingContainerWebView wrapping: aTestResult errorCount applying: [ :span | span addClass bootstrap label + span addClass bootstrap labelDanger ]);
				space;
				render: 'errors';
				space ];
		build
]
