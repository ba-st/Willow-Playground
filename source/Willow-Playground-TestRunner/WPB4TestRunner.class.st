"
I'm a Bootstrap 4 based version of the test runner
"
Class {
	#name : #WPB4TestRunner,
	#superclass : #WillowApplication,
	#instVars : [
		'contentView'
	],
	#category : #'Willow-Playground-TestRunner-Application'
}

{ #category : #accessing }
WPB4TestRunner class >> applicationTitle [

	^ 'Test Runner [Bootstrap 4]'
]

{ #category : #accessing }
WPB4TestRunner class >> handlerName [

	^ 'test-runner-bootstrap4'
]

{ #category : #accessing }
WPB4TestRunner class >> sessionClass [

	^ WPTestRunnerSession
]

{ #category : #Accessing }
WPB4TestRunner >> componentSupplierForApplication [

	^ Bootstrap4ComponentSupplier
		usingLibraries:
			{(self deploymentMode libraryFor: Bootstrap4MetadataLibrary)
				withoutBundledDependencies.
			(self deploymentMode libraryFor: BootstrapSelectLibrary)
				using: self language.
			(self deploymentMode libraryFor: BootstrapDatepickerLibrary)
				using: self language.
			(self deploymentMode libraryFor: BootstrapTypeaheadLibrary) default}
]

{ #category : #accessing }
WPB4TestRunner >> contentView [

	^ contentView
]

{ #category : #hooks }
WPB4TestRunner >> initialRequest: request [

	super initialRequest: request.
	self initializeContainerView
]

{ #category : #initialization }
WPB4TestRunner >> initialize [

	super initialize.
	contentView := [ :canvas |  ]
]

{ #category : #private }
WPB4TestRunner >> initializeContainerView [

	| testResult |

	testResult := IdentifiedWebView
		forDivNamed: 'test-result'
		containing: WPB4TestRunnerTestResultWebView new.
	contentView := GenericContainerWebView
		wrapping:
			( self componentSupplier gridBuilder
				columnsPerRow: 1;
				addContent: ( HeadingWebView displaying: 'Willow Based Test Runner' withLevel: 1 );
				addContent: testResult;
				addContent: ( self toolbarRenderingOnAction: testResult );
				addContent: WPTestRunnerSuiteSelectionWebView new;
				build )
		applying: [ :div | div addClass bootstrap4 container ]
]

{ #category : #accessing }
WPB4TestRunner >> jQueryLibrary [

	^ (self deploymentMode libraryFor: JQuery3MetadataLibrary) default
]

{ #category : #updating }
WPB4TestRunner >> requiredLibraries [

	^ {( self deploymentMode libraryFor: SpinKitMetadataLibrary ) default}
]

{ #category : #private }
WPB4TestRunner >> toolbarRenderingOnAction: testResult [

	| toolbar |

	toolbar := WPB4TestRunnerToolbar new.

	toolbar onRunSelectedTestsTrigger
		transform: testResult into: SpinKitFlow new;
		evaluate: [ self session applicationContext runTests ];
		render: testResult.

	toolbar onRunProfiledTrigger
		transform: testResult into: SpinKitPlane new;
		determineBehaviorByEvaluating: [ :response | 
			self session applicationContext runTestsProfiled.
			response onReturn
				open: WPB4TestRunnerMessageTallyDialog new;
				render: testResult ].

	^ toolbar
]
