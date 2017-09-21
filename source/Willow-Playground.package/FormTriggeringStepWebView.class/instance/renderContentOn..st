rendering
renderContentOn: aCanvas

	| input button |

	input := TextFieldWebView
		singleLineTriggeringOnChangeApplying: CompositeComponentCommand empty.

	button := SynchronicSubmitButtonWebView
		labeled: 'Ask it!'
		applying: CompositeComponentCommand empty
		evaluating: [  ].
	button onTrigger
		serializeContainerForm;
		disable;
		determineBehaviorByEvaluating: [ :response | 
			| answer |

			answer := UIManager default textEntry: input contents.
			response onReturn setValueTo: answer thenTriggerChangeOf: input ].

	aCanvas form
		doNotSubmit;
		with: [ input identifyIn: aCanvas.
			aCanvas
				span: 'Enter a question';
				render: input;
				render: button ]