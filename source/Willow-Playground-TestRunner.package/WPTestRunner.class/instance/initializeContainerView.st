private
initializeContainerView

	| suiteSelection testResult toolbar |

	testResult := IdentifiedWebView forDivNamed: 'test-result' containing: WPTestRunnerTestResultWebView new.
	toolbar := WPTestRunnerToolbar new.
	toolbar onRunSelectedTestsTrigger
		executeOnClient: [ :script :canvas | script << (canvas jQuery id: testResult identifier) html: SpinKitTripleBounce new ];
		evaluate: [ self session applicationContext runTests ];
		render: testResult.
	toolbar onRunProfiledTrigger
		executeOnClient: [ :script :canvas | script << (canvas jQuery id: testResult identifier) html: SpinKitTripleBounce new ];
		determineBehaviorByEvaluating: [ :response | 
			self session applicationContext runTestsProfiled.
			response onReturn
				open: WPTestRunnerMessageTallyDialog new;
				render: testResult ].
	suiteSelection := WPTestRunnerSuiteSelectionWebView new.
	contentView := GenericContainerWebView
		wrapping: [ :canvas | 
			canvas
				render: (self rowWrapping: (HeadingWebView displaying: 'Willow Based Test Runner' withLevel: 1));
				render: (self rowWrapping: testResult);
				render: (self rowWrapping: toolbar);
				render: (self rowWrapping: suiteSelection) ]
		applying: [ :div | div addClass bootstrap container ]