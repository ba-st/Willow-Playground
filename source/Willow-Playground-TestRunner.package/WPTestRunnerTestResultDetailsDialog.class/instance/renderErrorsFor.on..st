rendering
renderErrorsFor: aTestResult on: html

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