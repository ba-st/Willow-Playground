initialization
initializeRunProfiledButton

	runProfiledButton := self componentSupplier asynchronicButtonLabeled: (self label: 'Run Profiled' prependedBy: Glyphicons stats) applying: [ :button | button addClass bootstrap buttonDefault ]