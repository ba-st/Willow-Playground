private-accessing
buttonRendering: companion

	| button |

	button := AsynchronicButtonWebView labeled: 'Click for a change'.
	button onTrigger render: companion.
	^ button