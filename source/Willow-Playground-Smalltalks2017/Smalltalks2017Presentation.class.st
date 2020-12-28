"
I'm the presentation :)
"
Class {
	#name : #Smalltalks2017Presentation,
	#superclass : #WillowApplication,
	#instVars : [
		'currentStepView',
		'currentStepIndex',
		'stepViews'
	],
	#category : #'Willow-Playground-Smalltalks2017-Application'
}

{ #category : #accessing }
Smalltalks2017Presentation class >> applicationTitle [

	^ 'Willow 101'
]

{ #category : #accessing }
Smalltalks2017Presentation class >> handlerName [

	^ 'willow101'
]

{ #category : #'private-utility' }
Smalltalks2017Presentation class >> registerAsApplicationUsing: deploymentModeClass [

	| application |

	application := super registerAsApplicationUsing: deploymentModeClass.
	application configuration at: #maximumRelativeAge put: 3600.
	application cache: application createCache.
	^ application
]

{ #category : #'private-utility' }
Smalltalks2017Presentation class >> start [

	Smalltalks2017Presentation registerAsDevelopmentApplication.
	WPB3TestRunner registerAsDevelopmentApplication.
	WPB4TestRunner registerAsDevelopmentApplication.
	WPLiveDocumentation registerAsDevelopmentApplication.
	( ZnZincServerAdaptor port: 8080 )
		codec: GRPharoUtf8Codec new;
		start
]

{ #category : #'private-utility' }
Smalltalks2017Presentation class >> stop [

	ZnServer stopDefault.
	ZnZincServerAdaptor allInstancesDo: [ :each | each shutDown ].
	Smalltalks2017Presentation unregisterFromApplications.
	WPB4TestRunner unregisterFromApplications.
	WPB3TestRunner unregisterFromApplications.
	WPLiveDocumentation unregisterFromApplications.
	Smalltalk garbageCollect
]

{ #category : #accessing }
Smalltalks2017Presentation >> componentSupplierForApplication [

	^ Bootstrap3ComponentSupplier
		withBootstrapLibrary: (self deploymentMode libraryFor: Bootstrap3MetadataLibrary) withoutOptionalTheme
		selectLibrary: ((self deploymentMode libraryFor: BootstrapSelectLibrary) using: self language)
		datepickerLibrary: ((self deploymentMode libraryFor: BootstrapDatepickerLibrary) using: self language)
		typeaheadLibrary: (self deploymentMode libraryFor: BootstrapTypeaheadLibrary) new
]

{ #category : #accessing }
Smalltalks2017Presentation >> contentView [

	^ currentStepView
]

{ #category : #initialization }
Smalltalks2017Presentation >> initialRequest: request [

	super initialRequest: request.
	
	self initializeStepViews.
	currentStepIndex := 1.
	self initializeCurrentStepView
]

{ #category : #initialization }
Smalltalks2017Presentation >> initializeCurrentStepView [

	currentStepView := IdentifiedWebView
		forDivNamed: 'currentStep'
		containing: [ :canvas | self renderCurrentStepOn: canvas ]
		applying: [ :div | div addClass smalltalks2017 presentationArea ]
]

{ #category : #initialization }
Smalltalks2017Presentation >> initializeStepViews [

	stepViews := OrderedCollection new
		add: IntroductionStepWebView new;
		add: RenderingStepWebView new;
		add: NonInteractiveButtonStepWebView new;
		add: UserAgentButtonStepWebView new;
		add: ButtonEvaluatingBlockStepWebView new;
		add: ButtonRenderingComponentStepWebView new;
		add: FormTriggeringStepWebView new;
		add: ComponentSummaryStepWebView new;
		add: StyledButtonStepWebView new;
		add: ComponentWithCommandsStepWebView new;
		add: CommandSummaryStepWebView new;
		add: AdvancedComponentsExampleStepWebView new;
		add: ComponentSupplierStepWebView new;
		add: PlaygroundApplicationsStepWebView new;
		add: ScreenshotsStepWebView new;
		add: ProjectLocationStepWebView new;
		yourself
]

{ #category : #accessing }
Smalltalks2017Presentation >> jQueryLibrary [

	^(self deploymentMode libraryFor: JQuery3MetadataLibrary) default
]

{ #category : #'private - accessing' }
Smalltalks2017Presentation >> nextStepButton [

	| button |

	button := self componentSupplier
		asynchronicButtonLabeled: [ :canvas | 
			canvas
				render: self nextStepView shortName;
				space;
				render: ( Bootstrap3IconWebView representing: Glyphicons chevronRight )
			]
		applying:
			[ :theButton | theButton addClass bootstrap3 pullRight + theButton addClass bootstrap3 buttonDefault ].
	button on trigger
		serverDo: [ currentStepIndex := self nextStepIndex ];
		render: currentStepView.
	^ button
]

{ #category : #'private - accessing' }
Smalltalks2017Presentation >> nextStepIndex [

	^ currentStepIndex + 1 min: stepViews size
]

{ #category : #'private - accessing' }
Smalltalks2017Presentation >> nextStepView [

	^ stepViews at: self nextStepIndex
]

{ #category : #'private - accessing' }
Smalltalks2017Presentation >> previousStepButton [

	| button |

	button := self componentSupplier
		asynchronicButtonLabeled: [ :canvas | 
			canvas
				render: ( Bootstrap3IconWebView representing: Glyphicons chevronLeft );
				space;
				render: self previousStepView shortName
			]
		applying:
			[ :theButton | theButton addClass bootstrap3 pullLeft + theButton addClass bootstrap3 buttonDefault ].
	button on trigger
		serverDo: [ currentStepIndex := self previousStepIndex ];
		render: currentStepView.
	^ button
]

{ #category : #'private - accessing' }
Smalltalks2017Presentation >> previousStepIndex [

	^ currentStepIndex - 1 max: 1
]

{ #category : #'private - accessing' }
Smalltalks2017Presentation >> previousStepView [

	^ stepViews at: self previousStepIndex
]

{ #category : #'private - rendering' }
Smalltalks2017Presentation >> renderCurrentStepOn: aCanvas [

	| view |

	view := stepViews at: currentStepIndex.
	aCanvas heading: view shortName.
	aCanvas div with: view applying: [ :div | div addClass smalltalks2017 stepContent ].

	self renderStepButtonsOn: aCanvas
]

{ #category : #'private - rendering' }
Smalltalks2017Presentation >> renderStepButtonsOn: aCanvas [

	aCanvas div
		with: [ currentStepIndex = 1
				ifFalse: [ aCanvas render: self previousStepButton ].

			currentStepIndex = stepViews size
				ifFalse: [ aCanvas render: self nextStepButton ] ]
		applying: [ :div | div addClass smalltalks2017 stepButtonContainer ]
]

{ #category : #updating }
Smalltalks2017Presentation >> requiredLibraries [

	" Libraries added here are not considered until the server is restarted.
	  Including a library with a favicon.ico will automatically use it.	"

	^ {Smalltalks2017FileMetadataLibrary default.
	( self deploymentMode libraryFor: SpinKitMetadataLibrary ) default}
]
