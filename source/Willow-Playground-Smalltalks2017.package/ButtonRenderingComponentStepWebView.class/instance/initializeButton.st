initialization
initializeButton
	button := AsynchronicButtonWebView labeled: 'Click for a change'.
	button onTrigger
		render: companionView