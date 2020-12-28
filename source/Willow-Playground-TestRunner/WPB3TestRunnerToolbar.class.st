"
Im the test runner toolbar
"
Class {
	#name : #WPB3TestRunnerToolbar,
	#superclass : #WAPainter,
	#instVars : [
		'runSelectedTestsButton',
		'runProfiledButton',
		'exportResultButton'
	],
	#category : #'Willow-Playground-TestRunner-WebViews-Bootstrap-3'
}

{ #category : #initialization }
WPB3TestRunnerToolbar >> initialize [

	super initialize.
	self
		initializeRunSelectedTestsButton;
		initializeRunProfiledButton;
		initializeExportResultButton
]

{ #category : #initialization }
WPB3TestRunnerToolbar >> initializeExportResultButton [

	exportResultButton := FileDownloadAnchorWebView
		labeled: (self label: 'Download' prependedBy: Glyphicons cloudDownload)
		applying: [ :button | button addClass bootstrap3 button + button addClass bootstrap3 buttonDefault + button addClass bootstrap3 pullRight ]
		obtainingFileUsing: [ WAMimeDocument on: (String streamContents: [ :stream | self session applicationContext currentTestResult fileOutOn: stream ]) mimeType: WAMimeType textPlain fileName: 'test-results.txt' ]
]

{ #category : #initialization }
WPB3TestRunnerToolbar >> initializeRunProfiledButton [

	runProfiledButton := self componentSupplier asynchronicButtonLabeled: (self label: 'Run Profiled' prependedBy: Glyphicons stats) applying: [ :button | button addClass bootstrap3 buttonDefault ]
]

{ #category : #initialization }
WPB3TestRunnerToolbar >> initializeRunSelectedTestsButton [

	runSelectedTestsButton := self componentSupplier
		asynchronicButtonLabeled: ( self label: 'Run Selected' prependedBy: Glyphicons play )
		applying: [ :button | button addClass bootstrap3 buttonDefault ]
]

{ #category : #private }
WPB3TestRunnerToolbar >> label: aText prependedBy: anIconClass [

	^ [ :canvas | 
	canvas
		render: (Bootstrap3IconWebView representing: anIconClass);
		space;
		render: aText ]
]

{ #category : #Interaction }
WPB3TestRunnerToolbar >> onRunProfiledTrigger [

	^ runProfiledButton on trigger
]

{ #category : #Interaction }
WPB3TestRunnerToolbar >> onRunSelectedTestsTrigger [

	^ runSelectedTestsButton on trigger
]

{ #category : #rendering }
WPB3TestRunnerToolbar >> renderContentOn: html [

	html div
		with: [ 
			html div
				with: [ html
						render: runSelectedTestsButton;
						render: runProfiledButton ]
				applying: [ :div | div addClass bootstrap3 buttonGroup ].
			html render: exportResultButton ]
		applying: [ :div | div addClass bootstrap3 buttonToolbar ].
	html div: [ html space ]
]
