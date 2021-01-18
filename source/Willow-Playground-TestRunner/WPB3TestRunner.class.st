"
I'm a web version of the test runner 
"
Class {
	#name : #WPB3TestRunner,
	#superclass : #WillowApplication,
	#instVars : [
		'contentView'
	],
	#category : #'Willow-Playground-TestRunner-Application'
}

{ #category : #accessing }
WPB3TestRunner class >> applicationTitle [

	^ 'Test Runner'
]

{ #category : #accessing }
WPB3TestRunner class >> handlerName [

	^ 'test-runner-bootstrap3'
]

{ #category : #accessing }
WPB3TestRunner class >> sessionClass [

	^ WPTestRunnerSession
]

{ #category : #Accessing }
WPB3TestRunner >> componentSupplierForApplication [

	^ Bootstrap3ComponentSupplier
		withBootstrapLibrary: (self deploymentMode libraryFor: Bootstrap3MetadataLibrary) withoutOptionalTheme
		selectLibrary: ((self deploymentMode libraryFor: BootstrapSelectLibrary) using: self language)
		datepickerLibrary: ((self deploymentMode libraryFor: BootstrapDatepickerLibrary) using: self language)
		typeaheadLibrary: (self deploymentMode libraryFor: BootstrapTypeaheadLibrary) default
]

{ #category : #accessing }
WPB3TestRunner >> contentView [

	^ contentView
]

{ #category : #hooks }
WPB3TestRunner >> initialRequest: request [

	super initialRequest: request.
	self initializeContainerView
]

{ #category : #initialization }
WPB3TestRunner >> initialize [

	super initialize.
	contentView := [ :canvas |  ]
]

{ #category : #private }
WPB3TestRunner >> initializeContainerView [

	| testResult |

	testResult := self componentSupplier
		divisionContainerWrapping: WPB3TestRunnerTestResultWebView new
		applying: [  ].
	contentView := self componentSupplier
		divisionContainerWrapping:
			( self componentSupplier gridBuilder
				columnsPerRow: 1;
				addContent: ( HeadingWebView displaying: 'Willow Based Test Runner' withLevel: 1 );
				addContent: testResult;
				addContent: ( self toolbarRenderingOnAction: testResult );
				addContent: WPTestRunnerSuiteSelectionWebView new;
				build )
		applying: [ :div | div addClass bootstrap3 container ]
]

{ #category : #accessing }
WPB3TestRunner >> jQueryLibrary [

	^ (self deploymentMode libraryFor: JQuery3MetadataLibrary) default
]

{ #category : #updating }
WPB3TestRunner >> requiredLibraries [

	^ {( self deploymentMode libraryFor: SpinKitMetadataLibrary ) default}
]

{ #category : #private }
WPB3TestRunner >> toolbarRenderingOnAction: testResult [

	| toolbar |

	toolbar := WPB3TestRunnerToolbar new.

	toolbar onRunSelectedTestsTrigger
		transform: testResult into: SpinKitFlow new;
		serverDo: [ self session applicationContext runTests ];
		render: testResult.

	toolbar onRunProfiledTrigger
		transform: testResult into: SpinKitPlane new;
		serverDo: [ :request | 
			self session applicationContext runTestsProfiled.
			request onRespond
				open: WPB3TestRunnerMessageTallyDialog new;
				render: testResult
			].

	^ toolbar
]
