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
		closeButtonLabeled: 'Close' applying: [ :button | button addClass bootstrap3 buttonLink ];
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

			html render: (HeadingWebView displaying: ('Errors (<1p>)' expandMacrosWith: aTestResult errorCount) withLevel: 4 applying: [ :heading | heading addClass bootstrap3 textDanger ]).

			errorsTable := self componentSupplier tableBuilder
				addColumn: [ :column | 
					column
						titled: 'Class' applying: [ :headingCell | headingCell addClass bootstrap3 textDanger ];
						rendering: [ :failure | failure class name ] ];
				addColumn: [ :column | 
					column
						titled: 'Selector' applying: [ :headingCell | headingCell addClass bootstrap3 textDanger ];
						rendering: [ :failure | failure selector ] ];
				build.
			errorsTable changeContentsTo: aTestResult errors.
			html render: errorsTable ]
]

{ #category : #rendering }
WPTestRunnerTestResultDetailsDialog >> renderFailuresFor: aTestResult on: html [

	aTestResult hasFailures
		ifTrue: [ | failuresTable |

			html render: (HeadingWebView displaying: ('Failures (<1p>)' expandMacrosWith: aTestResult failureCount) withLevel: 4 applying: [ :heading | heading addClass bootstrap3 textWarning ]).

			failuresTable := self componentSupplier tableBuilder
				addColumn: [ :column | 
					column
						titled: 'Class' applying: [ :headingCell | headingCell addClass bootstrap3 textWarning ];
						rendering: [ :failure | failure class name ] ];
				addColumn: [ :column | 
					column
						titled: 'Selector' applying: [ :headingCell | headingCell addClass bootstrap3 textWarning ];
						rendering: [ :failure | failure selector ] ];
				build.
			failuresTable changeContentsTo: aTestResult failures.
			html render: failuresTable ]
]

{ #category : #rendering }
WPTestRunnerTestResultDetailsDialog >> summaryFor: aTestResult [

	^ self componentSupplier gridBuilder
		columnsPerRow: 1;
		applyingToCells: [ :cell | cell addClass bootstrap3 textCenter ];
		addContent: [ :canvas | 
			canvas
				render: (HeadingWebView displaying: 'Summary' withLevel: 4 applying: [ :heading | heading addClass bootstrap3 textInfo + heading addClass bootstrap3 textLeft ]);
				render: (PhrasingContainerWebView wrapping: aTestResult runCount applying: [ :span | span addClass bootstrap3 label + span addClass bootstrap3 labelDefault ]);
				space;
				render: 'run';
				space;
				render: (PhrasingContainerWebView wrapping: aTestResult passedCount applying: [ :span | span addClass bootstrap3 label + span addClass bootstrap3 labelSuccess ]);
				space;
				render: 'passes';
				space;
				render: (PhrasingContainerWebView wrapping: aTestResult skippedCount applying: [ :span | span addClass bootstrap3 label + span addClass bootstrap3 labelInfo ]);
				space;
				render: 'skipped';
				space;
				render: (PhrasingContainerWebView wrapping: aTestResult failureCount applying: [ :span | span addClass bootstrap3 label + span addClass bootstrap3 labelWarning ]);
				space;
				render: 'failures';
				space;
				render: (PhrasingContainerWebView wrapping: aTestResult errorCount applying: [ :span | span addClass bootstrap3 label + span addClass bootstrap3 labelDanger ]);
				space;
				render: 'errors';
				space ];
		build
]
