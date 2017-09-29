initialization
initializeExportResultButton

	exportResultButton := FileDownloadAnchorWebView
		labeled: (self label: 'Download' prependedBy: Glyphicons cloudDownload)
		applying: [ :button | button addClass bootstrap button + button addClass bootstrap buttonDefault + button addClass bootstrap pullRight ]
		obtainingFileUsing: [ WAMimeDocument on: (String streamContents: [ :stream | self session applicationContext currentTestResult fileOutOn: stream ]) mimeType: WAMimeType textPlain fileName: 'test-results.txt' ]