initialization
initializeFor: aMethod

	method := aMethod.
	methodPanel := self componentSupplier panelBuilder
		headingDisplaying: [:canvas | canvas strong: method selector];
		buildApplying: [ :panel | panel addClass bootstrap panelDefault ]