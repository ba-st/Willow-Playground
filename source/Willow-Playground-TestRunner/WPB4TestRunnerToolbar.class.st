Class {
	#name : #WPB4TestRunnerToolbar,
	#superclass : #WAPainter,
	#instVars : [
		'runSelectedTestsButton',
		'runProfiledButton',
		'exportResultButton'
	],
	#category : #'Willow-Playground-TestRunner-WebViews-Bootstrap-4'
}

{ #category : #initialization }
WPB4TestRunnerToolbar >> initialize [

	super initialize.
	self
		initializeRunSelectedTestsButton;
		initializeRunProfiledButton;
		initializeExportResultButton
]

{ #category : #initialization }
WPB4TestRunnerToolbar >> initializeExportResultButton [

	exportResultButton := FileDownloadAnchorWebView
		labeled: 'Download'
		applying: [ :button | 
			button addClass bootstrap4 button + button addClass bootstrap4 buttonSecondary
				+ button addClass bootstrap4 floatRight
			]
		obtainingFileUsing: [ WAMimeDocument
				on:
					( String
						streamContents: [ :stream | self session applicationContext currentTestResult fileOutOn: stream ] )
				mimeType: WAMimeType textPlain
				fileName: 'test-results.txt'
			]
]

{ #category : #initialization }
WPB4TestRunnerToolbar >> initializeRunProfiledButton [

	runProfiledButton := self componentSupplier
		asynchronicButtonLabeled: 'Run Profiled'
		applying: [ :button | button addClass bootstrap4 buttonSecondary ]
]

{ #category : #initialization }
WPB4TestRunnerToolbar >> initializeRunSelectedTestsButton [

	runSelectedTestsButton := self componentSupplier
		asynchronicButtonLabeled: 'Run Selected'
		applying: [ :button | button addClass bootstrap4 buttonPrimary ]
]

{ #category : #Interaction }
WPB4TestRunnerToolbar >> onRunProfiledTrigger [

	^ runProfiledButton onTrigger
]

{ #category : #Interaction }
WPB4TestRunnerToolbar >> onRunSelectedTestsTrigger [

	^ runSelectedTestsButton onTrigger
]

{ #category : #rendering }
WPB4TestRunnerToolbar >> renderContentOn: html [

	html render: exportResultButton.
	html div
		with: [ html div
				with: [ html
						render: runSelectedTestsButton;
						render: runProfiledButton
					]
				applying: [ :div | div addClass bootstrap4 buttonGroup ]
			]
		applying: [ :div | div addClass bootstrap4 buttonToolbar ].
	html div: [ html space ]
]
