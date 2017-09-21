private - accessing
previousStepButton

	| button |

	button := self componentSupplier
		asynchronicButtonLabeled: self previousStepView shortName
		applying: CompositeComponentCommand empty.
	button onTrigger
		evaluate: [ currentStepIndex := self previousStepIndex ];
		render: currentStepView.
	^ button