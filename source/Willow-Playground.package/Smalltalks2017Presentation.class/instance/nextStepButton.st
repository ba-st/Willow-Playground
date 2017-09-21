private - accessing
nextStepButton

	| button |

	button := self componentSupplier
		asynchronicButtonLabeled: self nextStepView shortName
		applying: CompositeComponentCommand empty.
	button onTrigger
		evaluate: [ currentStepIndex := self nextStepIndex ];
		render: currentStepView.
	^ button