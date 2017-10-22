private-accessing
anchorToBrowse: method

	| anchor |

	anchor := AsynchronicAnchorWebView labeled: method selector.
	anchor onTrigger evaluate: [ method browse ].
	^ anchor