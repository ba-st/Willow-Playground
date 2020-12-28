"
I'm a step showing a list of example applications.
"
Class {
	#name : #PlaygroundApplicationsStepWebView,
	#superclass : #PresentationStepWebView,
	#category : #'Willow-Playground-Smalltalks2017-WebViews'
}

{ #category : #accessing }
PlaygroundApplicationsStepWebView >> description [

	^ 'Let''s see what you can do with Willow'
]

{ #category : #'private-accessing' }
PlaygroundApplicationsStepWebView >> liveDocumentationAnchor [

	^ self componentSupplier asynchronicLinkLabeled: 'Open the Live Documentation!' applying: (OpenLocationCommand forNewBrowsingContextNavigatingTo: WPLiveDocumentation handlerName)
]

{ #category : #rendering }
PlaygroundApplicationsStepWebView >> renderContentOn: aCanvas [

	self
		renderPanelWrapping: [ :canvas | 
			canvas
				paragraph: self testRunnerAnchor;
				paragraph: self liveDocumentationAnchor ]
		on: aCanvas
]

{ #category : #accessing }
PlaygroundApplicationsStepWebView >> shortName [

	^ 'Some Examples'
]

{ #category : #'private-accessing' }
PlaygroundApplicationsStepWebView >> testRunnerAnchor [

	^ self componentSupplier
		asynchronicLinkLabeled: 'Open the Test Runner!'
		applying: (OpenLocationCommand forNewBrowsingContextNavigatingTo:WPB3TestRunner handlerName)
]
