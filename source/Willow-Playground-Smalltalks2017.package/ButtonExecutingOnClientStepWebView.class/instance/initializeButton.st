initialization
initializeButton

 button := AsynchronicButtonWebView labeled: 'Now it''s time to click'.
 button onTrigger
	executeOnClient: [ :script :scriptCanvas |
				script << scriptCanvas
				javascript alert: 'You just clicked a button' ]
 