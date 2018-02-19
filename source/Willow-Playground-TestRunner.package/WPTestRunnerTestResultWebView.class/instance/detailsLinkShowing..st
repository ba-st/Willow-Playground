rendering
detailsLinkShowing: testResult

	| showDetailsAnchor |

	showDetailsAnchor := self componentSupplier
		asynchronicLinkActingAsButtonLabeled: 'See the details here.'
		applying: [ :anchor | anchor addClass bootstrap alertLink ].
	showDetailsAnchor onTrigger open: (WPTestRunnerTestResultDetailsDialog for: testResult).
	^ showDetailsAnchor