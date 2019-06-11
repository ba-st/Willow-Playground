"
I'm a web version of the test runner 
"
Class {
	#name : #WPTestRunner,
	#superclass : #WillowApplication,
	#instVars : [
		'contentView'
	],
	#category : #'Willow-Playground-TestRunner-Application'
}

{ #category : #accessing }
WPTestRunner class >> applicationTitle [

	^ 'Test Runner'
]

{ #category : #accessing }
WPTestRunner class >> handlerName [

	^ 'test-runner-bootstrap3'
]

{ #category : #accessing }
WPTestRunner class >> sessionClass [

	^ WPTestRunnerSession
]

{ #category : #Accessing }
WPTestRunner >> componentSupplierForApplication [

	^ BootstrapComponentSupplier
		withBootstrapLibrary: (self deploymentMode libraryFor: Bootstrap3MetadataLibrary) withoutOptionalTheme
		selectLibrary: ((self deploymentMode libraryFor: BootstrapSelectLibrary) using: self language)
		datepickerLibrary: ((self deploymentMode libraryFor: BootstrapDatepickerLibrary) using: self language)
		typeaheadLibrary: (self deploymentMode libraryFor: BootstrapTypeaheadLibrary) default
]

{ #category : #accessing }
WPTestRunner >> contentView [

	^ contentView
]

{ #category : #hooks }
WPTestRunner >> initialRequest: request [

	super initialRequest: request.
	self initializeContainerView
]

{ #category : #initialization }
WPTestRunner >> initialize [

	super initialize.
	contentView := [ :canvas |  ]
]

{ #category : #private }
WPTestRunner >> initializeContainerView [

	| testResult |

	testResult := IdentifiedWebView forDivNamed: 'test-result' containing: WPTestRunnerTestResultWebView new.
	contentView := GenericContainerWebView
		wrapping:
			(self componentSupplier gridBuilder
				columnsPerRow: 1;
				addContent: (HeadingWebView displaying: 'Willow Based Test Runner' withLevel: 1);
				addContent: testResult;
				addContent: (self toolbarRenderingOnAction: testResult);
				addContent: WPTestRunnerSuiteSelectionWebView new;
				build)
		applying: [ :div | div addClass bootstrap container ]
]

{ #category : #accessing }
WPTestRunner >> jQueryLibrary [

	^ (self deploymentMode libraryFor: JQuery3MetadataLibrary) default
]

{ #category : #updating }
WPTestRunner >> requiredLibraries [

	^ {SpinKitMetadataLibrary default}
]

{ #category : #private }
WPTestRunner >> toolbarRenderingOnAction: testResult [

	| toolbar |

	toolbar := WPTestRunnerToolbar new.

	toolbar onRunSelectedTestsTrigger
		transform: testResult into: SpinKitTripleBounce new;
		evaluate: [ self session applicationContext runTests ];
		render: testResult.

	toolbar onRunProfiledTrigger
		transform: testResult into: SpinKitRotatingPlane new;
		determineBehaviorByEvaluating: [ :response | 
			self session applicationContext runTestsProfiled.
			response onReturn
				open: WPTestRunnerMessageTallyDialog new;
				render: testResult ].

	^ toolbar
]
