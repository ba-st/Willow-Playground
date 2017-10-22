private - accessing
nextStepButton

	| button |

	button := self componentSupplier
		asynchronicButtonLabeled: [ :canvas | 
			canvas
				render: self nextStepView shortName;
				space;
				render: (BootstrapIconWebView representing: Glyphicons forward) ]
		applying: [ :theButton | theButton addClass smalltalks2017 nextStep ].
	button onTrigger
		evaluate: [ currentStepIndex := self nextStepIndex ];
		render: currentStepView.
	^ button