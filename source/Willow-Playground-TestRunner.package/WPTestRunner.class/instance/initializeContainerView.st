private
initializeContainerView

	| suiteSelection testResult toolbar |

	testResult := IdentifiedWebView forDivNamed: 'test-result' containing: WPTestRunnerTestResultWebView new.
	toolbar := WPTestRunnerToolbar new.
	suiteSelection := WPTestRunnerSuiteSelectionWebView new.
	contentView := GenericContainerWebView
		wrapping: [ :canvas | 
			canvas
				render: (self rowWrapping: (self componentSupplier headingDisplaying: 'Willow Based Test Runner' withLevel: 1));
				render: (self rowWrapping: toolbar);
				render: (self rowWrapping: testResult);
				render: (self rowWrapping: suiteSelection) ]
		applying: [ :div | div addClass bootstrap container ]