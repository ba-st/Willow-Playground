private-accessing
contactFieldSet

	^ self componentSupplier
		fieldSetContaining:
			(self componentSupplier gridBuilder
				addContent: self gabrielCard;
				addContent: self maxiCard;
				build)
		applying: [ :content |  ]
		withLegend: 'Contact us!'
		applying: [ :legend |  ]