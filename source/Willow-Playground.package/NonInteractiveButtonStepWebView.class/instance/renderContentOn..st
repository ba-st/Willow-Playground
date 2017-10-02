rendering
renderContentOn: aCanvas

	| button |

	button := AsynchronicButtonWebView labeled: 'Do not click'.

	aCanvas render: button