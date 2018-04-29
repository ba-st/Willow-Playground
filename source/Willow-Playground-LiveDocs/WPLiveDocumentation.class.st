"
I'm a web version of the Pharo live documentation
"
Class {
	#name : #WPLiveDocumentation,
	#superclass : #WillowApplication,
	#instVars : [
		'contentView'
	],
	#category : #'Willow-Playground-LiveDocs-Application'
}

{ #category : #accessing }
WPLiveDocumentation class >> applicationTitle [

	^ 'Pharo Live Documentation'
]

{ #category : #accessing }
WPLiveDocumentation class >> handlerName [

	^ 'live-docs'
]

{ #category : #accessing }
WPLiveDocumentation class >> sessionClass [

	^ WPLiveDocumentationSession
]

{ #category : #Accessing }
WPLiveDocumentation >> componentSupplierForApplication [

	^ BootstrapComponentSupplier
		withBootstrapLibrary: (self deploymentMode libraryFor: Bootstrap3MetadataLibrary) withoutOptionalTheme
		selectLibrary: ((self deploymentMode libraryFor: BootstrapSelectLibrary) using: self language)
		datepickerLibrary: ((self deploymentMode libraryFor: BootstrapDatepickerLibrary) using: self language)
		typeaheadLibrary: (self deploymentMode libraryFor: BootstrapTypeaheadLibrary) default
]

{ #category : #accessing }
WPLiveDocumentation >> contentView [

	^ contentView
]

{ #category : #hooks }
WPLiveDocumentation >> initialRequest: request [

	super initialRequest: request.
	self initializeContainerView
]

{ #category : #initialization }
WPLiveDocumentation >> initialize [

	super initialize.
	contentView := [ :canvas |  ]
]

{ #category : #private }
WPLiveDocumentation >> initializeContainerView [

	| behaviorDetails scopeSelection |

	behaviorDetails := IdentifiedWebView
		forDivNamed: 'behavior-details'
		containing: WPLiveDocumentationBehaviorWebView new
		applying: [ :div :constants | 
			div
				setStyleTo: [ :style | 
					style
						maxHeight: 100 vh;
						overflowY: constants css scroll ] ].
	scopeSelection := WPLiveDocumentationScopeSelectionWebView new.
	scopeSelection onBehaviorSelectedTrigger show: SpinKitTripleBounce new whileCallingServerToRender: behaviorDetails.

	contentView := GenericContainerWebView
		wrapping:
			(self componentSupplier gridBuilder
				columnsWidths: #(3 9);
				addContent: scopeSelection;
				addContent: behaviorDetails;
				build)
		applying: [ :div | div addClass bootstrap container ]
]

{ #category : #accessing }
WPLiveDocumentation >> jQueryLibrary [

	^ (self deploymentMode libraryFor: JQuery3MetadataLibrary) default
]

{ #category : #accessing }
WPLiveDocumentation >> newComponentSupplier [

	^ BootstrapComponentSupplier
		withBootstrapLibrary: (self deploymentMode libraryFor: Bootstrap3MetadataLibrary) withoutOptionalTheme
		selectLibrary: ((self deploymentMode libraryFor: BootstrapSelectLibrary) using: self language)
		datepickerLibrary: ((self deploymentMode libraryFor: BootstrapDatepickerLibrary) using: self language)
		typeaheadLibrary: (self deploymentMode libraryFor: BootstrapTypeaheadLibrary) default
]

{ #category : #updating }
WPLiveDocumentation >> requiredLibraries [

	^ {SpinKitMetadataLibrary default}
]
