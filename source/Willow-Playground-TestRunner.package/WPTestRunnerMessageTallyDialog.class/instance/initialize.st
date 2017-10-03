initialization
initialize

	super initialize.
	dialog := self componentSupplier dialogBuilder
		headerTitled: 'Message Tally Result';
		wrapping: [ :canvas | self renderTallyOn: canvas ];
		closeButtonLabeled: 'Close' applying: [ :button | button addClass bootstrap buttonLink ];
		beSelfCleaning;
		buildApplying: [ :document | document addClass bootstrap modalLarge ]