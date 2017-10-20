private - accessing
previousStepButton

	| button |

	button := self componentSupplier
		asynchronicButtonLabeled: self previousStepView shortName
		applying: [ :theButton | theButton addClass smalltalks2017 previousStep ].
	button onTrigger
		evaluate: [ currentStepIndex := self previousStepIndex ];
		render: currentStepView.
	^ button