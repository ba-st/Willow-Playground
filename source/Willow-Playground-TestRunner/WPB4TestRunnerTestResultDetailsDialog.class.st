Class {
	#name : #WPB4TestRunnerTestResultDetailsDialog,
	#superclass : #WAPainter,
	#instVars : [
		'dialog'
	],
	#category : #'Willow-Playground-TestRunner-WebViews-Bootstrap-4'
}

{ #category : #'instance creation' }
WPB4TestRunnerTestResultDetailsDialog class >> for: aTestResult [

	^ self new initializeFor: aTestResult
]

{ #category : #initialization }
WPB4TestRunnerTestResultDetailsDialog >> initializeFor: aTestResult [

	dialog := self componentSupplier dialogBuilder
		headerTitled: 'Test Result Details';
		wrapping: [ :canvas | self renderDetailsFor: aTestResult on: canvas ];
		closeButtonLabeled: 'Close' applying: [ :button | button addClass bootstrap4 buttonLink ];
		beSelfCleaning;
		build
]

{ #category : #rendering }
WPB4TestRunnerTestResultDetailsDialog >> renderContentOn: html [

	html render: dialog
]

{ #category : #rendering }
WPB4TestRunnerTestResultDetailsDialog >> renderDetailsFor: aTestResult on: html [

	html render: (self summaryFor: aTestResult).
	self
		renderFailuresFor: aTestResult on: html;
		renderErrorsFor: aTestResult on: html
]

{ #category : #rendering }
WPB4TestRunnerTestResultDetailsDialog >> renderErrorsFor: aTestResult on: html [

	aTestResult hasErrors
		ifTrue: [ | errorsTable |

			html render: (HeadingWebView displaying: ('Errors (<1p>)' expandMacrosWith: aTestResult errorCount) withLevel: 4 applying: [ :heading | heading addClass bootstrap4 textDanger ]).

			errorsTable := self componentSupplier tableBuilder
				addColumn: [ :column | 
					column
						titled: 'Class' applying: [ :headingCell | headingCell addClass bootstrap4 textDanger ];
						rendering: [ :failure | failure class name ] ];
				addColumn: [ :column | 
					column
						titled: 'Selector' applying: [ :headingCell | headingCell addClass bootstrap4 textDanger ];
						rendering: [ :failure | failure selector ] ];
				build.
			errorsTable changeContentsTo: aTestResult errors.
			html render: errorsTable ]
]

{ #category : #rendering }
WPB4TestRunnerTestResultDetailsDialog >> renderFailuresFor: aTestResult on: html [

	aTestResult hasFailures
		ifTrue: [ | failuresTable |

			html render: (HeadingWebView displaying: ('Failures (<1p>)' expandMacrosWith: aTestResult failureCount) withLevel: 4 applying: [ :heading | heading addClass bootstrap4 textWarning ]).

			failuresTable := self componentSupplier tableBuilder
				addColumn: [ :column | 
					column
						titled: 'Class' applying: [ :headingCell | headingCell addClass bootstrap4 textWarning ];
						rendering: [ :failure | failure class name ] ];
				addColumn: [ :column | 
					column
						titled: 'Selector' applying: [ :headingCell | headingCell addClass bootstrap4 textWarning ];
						rendering: [ :failure | failure selector ] ];
				build.
			failuresTable changeContentsTo: aTestResult failures.
			html render: failuresTable ]
]

{ #category : #rendering }
WPB4TestRunnerTestResultDetailsDialog >> summaryFor: aTestResult [

	^ self componentSupplier gridBuilder
		columnsPerRow: 1;
		applyingToCells: [ :cell | cell addClass bootstrap3 textCenter ];
		addContent: [ :canvas | 
			canvas
				render:
					( HeadingWebView
						displaying: 'Summary'
						withLevel: 4
						applying: [ :heading | heading addClass bootstrap4 textInfo + heading addClass bootstrap4 textLeft ] );
				render:
					( self componentSupplier
						inlineContainerWrapping: aTestResult runCount
						applying: [ :span | span addClass bootstrap4 badge + span addClass bootstrap4 badgeSecondary ] );
				space;
				render: 'run';
				space;
				render:
					( self componentSupplier
						inlineContainerWrapping: aTestResult passedCount
						applying: [ :span | span addClass bootstrap4 badge + span addClass bootstrap4 badgeSuccess ] );
				space;
				render: 'passes';
				space;
				render:
					( self componentSupplier
						inlineContainerWrapping: aTestResult skippedCount
						applying: [ :span | span addClass bootstrap4 badge + span addClass bootstrap4 badgeInfo ] );
				space;
				render: 'skipped';
				space;
				render:
					( self componentSupplier
						inlineContainerWrapping: aTestResult failureCount
						applying: [ :span | span addClass bootstrap4 badge + span addClass bootstrap4 badgeWarning ] );
				space;
				render: 'failures';
				space;
				render:
					( self componentSupplier
						inlineContainerWrapping: aTestResult errorCount
						applying: [ :span | span addClass bootstrap4 badge + span addClass bootstrap4 badgeDanger ] );
				space;
				render: 'errors';
				space
			];
		build
]
