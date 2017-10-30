initialization
initializeButton
 button := AsynchronicButtonWebView
	labeled: 'Primary Bootstrap Button'
	applying:
		[ :theButton | theButton addClass bootstrap button + 
				theButton addClass bootstrap buttonPrimary ]