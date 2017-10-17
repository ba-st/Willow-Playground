private-accessing
formButtonAffecting: input

	| button |

	button := SynchronicSubmitButtonWebView
		labeled: 'Ask it!'
		applying: [ :theButton |  ]
		evaluating: [  ].
	button onTrigger
		serializeContainerForm;
		disable;
		determineBehaviorByEvaluating: [ :response | 
			| answer |
			answer := UIManager default textEntry: input contents.
			response onReturn setValueTo: answer thenTriggerChangeOf: input ].
	^ button