rendering
renderContentOn: aCanvas

	| button |

	button := AsynchronicButtonWebView
		labeled: 'Primary Bootstrap Button'
		applying: [ :theButton | theButton addClass bootstrap button + theButton addClass bootstrap buttonPrimary ].

	aCanvas render: button