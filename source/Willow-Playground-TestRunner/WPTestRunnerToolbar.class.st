"
Im the test runner toolbar
"
Class {
	#name : #WPTestRunnerToolbar,
	#superclass : #WAPainter,
	#instVars : [
		'runSelectedTestsButton',
		'runProfiledButton',
		'exportResultButton'
	],
	#category : #'Willow-Playground-TestRunner-WebViews'
}

{ #category : #initialization }
WPTestRunnerToolbar >> initialize [

	super initialize.
	self
		initializeRunSelectedTestsButton;
		initializeRunProfiledButton;
		initializeExportResultButton
]

{ #category : #initialization }
WPTestRunnerToolbar >> initializeExportResultButton [

	exportResultButton := FileDownloadAnchorWebView
		labeled: (self label: 'Download' prependedBy: Glyphicons cloudDownload)
		applying: [ :button | button addClass bootstrap button + button addClass bootstrap buttonDefault + button addClass bootstrap pullRight ]
		obtainingFileUsing: [ WAMimeDocument on: (String streamContents: [ :stream | self session applicationContext currentTestResult fileOutOn: stream ]) mimeType: WAMimeType textPlain fileName: 'test-results.txt' ]
]

{ #category : #initialization }
WPTestRunnerToolbar >> initializeRunProfiledButton [

	runProfiledButton := self componentSupplier asynchronicButtonLabeled: (self label: 'Run Profiled' prependedBy: Glyphicons stats) applying: [ :button | button addClass bootstrap buttonDefault ]
]

{ #category : #initialization }
WPTestRunnerToolbar >> initializeRunSelectedTestsButton [

	runSelectedTestsButton := self componentSupplier asynchronicButtonLabeled: (self label: 'Run Selected' prependedBy: Glyphicons play) applying: [ :button | button addClass bootstrap buttonDefault ]
]

{ #category : #private }
WPTestRunnerToolbar >> label: aText prependedBy: anIconClass [

	^ [ :canvas | 
	canvas
		render: (BootstrapIconWebView representing: anIconClass);
		space;
		render: aText ]
]

{ #category : #Interaction }
WPTestRunnerToolbar >> onRunProfiledTrigger [

	^ runProfiledButton onTrigger
]

{ #category : #Interaction }
WPTestRunnerToolbar >> onRunSelectedTestsTrigger [

	^ runSelectedTestsButton onTrigger
]

{ #category : #rendering }
WPTestRunnerToolbar >> renderContentOn: html [

	html div
		class: Willow classes >> #bootstrap >>#buttonToolbar;
		with: [ html div
				class: Willow classes >> #bootstrap >>#buttonGroup;
				with: [ html
						render: runSelectedTestsButton;
						render: runProfiledButton ].
			html render: exportResultButton ].
	html div: [ html space ]
]
