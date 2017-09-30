rendering
detailsLinkShowing: testResult

	| showDetailsAnchor |

	showDetailsAnchor := AsynchronicAnchorWebView labeled: 'See the details here.' applying: [ :anchor | anchor addClass bootstrap alertLink ].
	showDetailsAnchor onTrigger open: (WPTestRunnerTestResultDetailsDialog for: testResult).
	^ showDetailsAnchor