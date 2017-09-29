initialization
initializeExportResultButton

	exportResultButton := self componentSupplier
		asynchronicButtonLabeled: (self label: 'Download' prependedBy: Glyphicons cloudDownload)
		applying: [ :button | button addClass bootstrap buttonDefault + button addClass bootstrap pullRight ]