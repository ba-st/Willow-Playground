private - accessing
nextStepButton

	| button |

	button := self componentSupplier
		asynchronicButtonLabeled: self nextStepView shortName
		applying: [ :theButton | theButton addClass smalltalks2017 nextStep ].
	button onTrigger
		evaluate: [ currentStepIndex := self nextStepIndex ];
		render: currentStepView.
	^ button