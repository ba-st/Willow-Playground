rendering
renderFailuresFor: aTestResult on: html

	aTestResult hasFailures
		ifTrue: [ | failuresTable |

			html render: (HeadingWebView displaying: ('Failures (<1p>)' expandMacrosWith: aTestResult failureCount) withLevel: 1 applying: [ :heading | heading addClass bootstrap textWarning ]).

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