rendering
renderContentOn: aCanvas

	| button |

	button := AsynchronicButtonWebView labeled: 'Click... then check your image'.
	button onTrigger evaluate: [ 'The button was clicked on the browser' inspect ].

	aCanvas render: button