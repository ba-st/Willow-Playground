initialization
initializeFor: aTestResult

	dialog := self componentSupplier dialogBuilder
		headerTitled: 'Test Result Details';
		wrapping: [ :canvas | self renderDetailsFor: aTestResult on: canvas ];
		closeButtonLabeled: 'Close' applying: [ :button | button addClass bootstrap buttonLink ];
		beSelfCleaning;
		build