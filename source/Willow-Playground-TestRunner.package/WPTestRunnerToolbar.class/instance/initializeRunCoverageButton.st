initialization
initializeRunCoverageButton

	runCoverageButton := self componentSupplier asynchronicButtonLabeled: 'Run Coverage' applying: [ :button | button addClass bootstrap buttonDefault ]