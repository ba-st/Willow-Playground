private - accessing
previousStepButton

	| button |

	button := self componentSupplier
		asynchronicButtonLabeled: [ :canvas | 
			canvas
				render: (BootstrapIconWebView representing: Glyphicons backward);
				space;
				render: self previousStepView shortName ]
		applying: [ :theButton | theButton addClass smalltalks2017 previousStep ].
	button onTrigger
		evaluate: [ currentStepIndex := self previousStepIndex ];
		render: currentStepView.
	^ button