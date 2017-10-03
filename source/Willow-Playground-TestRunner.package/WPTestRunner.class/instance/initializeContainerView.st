private
initializeContainerView

	| testResult |

	testResult := IdentifiedWebView forDivNamed: 'test-result' containing: WPTestRunnerTestResultWebView new.
	contentView := GenericContainerWebView
		wrapping:
			(self componentSupplier gridBuilder
				columnsPerRow: 1;
				addContent: (HeadingWebView displaying: 'Willow Based Test Runner' withLevel: 1);
				addContent: testResult;
				addContent: (self toolbarRenderingOnAction: testResult);
				addContent: WPTestRunnerSuiteSelectionWebView new;
				build)
		applying: [ :div | div addClass bootstrap container ]