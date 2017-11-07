private - accessing
previousStepButton

	| button |

	button := self componentSupplier
		asynchronicButtonLabeled: [ :canvas | 
			canvas
				render: (BootstrapIconWebView representing: Glyphicons chevronLeft);
				space;
				render: self previousStepView shortName ]
		applying: [ :theButton | theButton addClass bootstrap pullLeft + theButton addClass bootstrap buttonDefault ].
	button onTrigger
		evaluate: [ currentStepIndex := self previousStepIndex ];
		render: currentStepView.
	^ button