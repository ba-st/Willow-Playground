initialization
initializeRunSelectedTestsButton

	runSelectedTestsButton := self componentSupplier asynchronicButtonLabeled: (self label: 'Run Selected' prependedBy: Glyphicons play) applying: [ :button | button addClass bootstrap buttonDefault ]