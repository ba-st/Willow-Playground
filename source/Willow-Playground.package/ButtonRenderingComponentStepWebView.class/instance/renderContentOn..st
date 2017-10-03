rendering
renderContentOn: aCanvas

	| button companion |

	companion := IdentifiedWebView
		forSpanNamed: 'Companion'
		containing: [ :canvas | canvas render: (GRPrinter isoTime print: Time now) ].

	button := AsynchronicButtonWebView labeled: 'Click for a change'.
	button onTrigger render: companion.

	aCanvas
		render: button;
		render: companion