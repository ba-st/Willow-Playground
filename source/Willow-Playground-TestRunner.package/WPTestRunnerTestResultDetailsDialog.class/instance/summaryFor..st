rendering
summaryFor: aTestResult

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