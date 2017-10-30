private-accessing
contactFieldSet

	^ self componentSupplier gridBuilder
		addContent: self gabrielCard;
		addContent: self maxiCard;
		build