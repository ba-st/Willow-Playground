private - accessing
nextStepButton

	| button |

	button := self componentSupplier
		asynchronicButtonLabeled: [ :canvas | 
			canvas
				render: self nextStepView shortName;
				space;
				render: (BootstrapIconWebView representing: Glyphicons chevronRight) ]
		applying: [ :theButton | theButton addClass bootstrap pullRight + theButton addClass bootstrap buttonDefault ].
	button onTrigger
		evaluate: [ currentStepIndex := self nextStepIndex ];
		render: currentStepView.
	^ button