initialization
initializeButton

	button := AsynchronicButtonWebView labeled: 'Ask it!'.
	button onTrigger
		serializeContainerForm;
		disable;
		determineBehaviorByEvaluating: [ :response | 
			| answer |
			answer := UIManager default textEntry: input contents.
			response onReturn setValueTo: answer thenTriggerChangeOf: input ]