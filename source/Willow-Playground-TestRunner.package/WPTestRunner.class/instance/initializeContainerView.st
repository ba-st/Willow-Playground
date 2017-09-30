private
initializeContainerView

	| testResult |

	testResult := IdentifiedWebView forDivNamed: 'test-result' containing: WPTestRunnerTestResultWebView new.
	contentView := GenericContainerWebView
		wrapping: [ :canvas | 
			canvas
				render: (self rowWrapping: (HeadingWebView displaying: 'Willow Based Test Runner' withLevel: 1));
				render: (self rowWrapping: testResult);
				render: (self rowWrapping: (self toolbarRenderingOnAction: testResult));
				render: (self rowWrapping: WPTestRunnerSuiteSelectionWebView new) ]
		applying: [ :div | div addClass bootstrap container ]