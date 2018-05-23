"
I'm the introduction step 
"
Class {
	#name : #IntroductionStepWebView,
	#superclass : #PresentationStepWebView,
	#category : #'Willow-Playground-Smalltalks2017-WebViews'
}

{ #category : #accessing }
IntroductionStepWebView >> description [

	^ 'Welcome to Willow 101: Feature Showcase'
]

{ #category : #'private-accessing' }
IntroductionStepWebView >> loadWillowFromGitHubCode [
 Metacello new
	baseline: 'Willow';
	repository: 'github://ba-st/Willow:master/source';
	load
]

{ #category : #'private-accessing' }
IntroductionStepWebView >> loadWillowPlaygroundFromGitHubCode [
 Metacello new
	baseline: 'WillowPlayground';
	repository: 'github://ba-st/Willow-Playground:master/source';
	load
]

{ #category : #rendering }
IntroductionStepWebView >> renderContentOn: aCanvas [

	| grid |

	grid := self componentSupplier gridBuilder
		columnsWidths: #(2 10);
		applyingToCells: [ :cell :constants | cell setStyleTo: [ :style | style textAlign: constants >> #css >> #justify ] ];
		addContent: self willowLogoView;
		addContent: [ :html | 
			html
				strong: 'Willow is a Web Interaction Library that eases the burden of creating AJAX-based web applications.';
				break;
				break;
				render: 'It''s built on top of the Seaside Web Framework providing a set of composable components, easier AJAX interaction and licensed under MIT.' ];
		build.
	aCanvas
		render: grid;
		break;
		render:
			(self componentSupplier
				fieldSetContaining: [ :html | 
					self renderSourceOf: #loadWillowFromGitHubCode on: html.
					self renderSourceOf: #loadWillowPlaygroundFromGitHubCode on: html ]
				applying: [  ]
				withLegend: 'Get Started!'
				applying: [  ])
]

{ #category : #accessing }
IntroductionStepWebView >> shortName [

	^ 'Introduction'
]

{ #category : #'private-accessing' }
IntroductionStepWebView >> willowLogoView [

	^ ImageWebView
		locatedAt: Smalltalks2017FileMetadataLibrary / #willowlogoSvg
		applying: [ :image | image setStyleTo: [ :style | style width: 128 px ] ]
]
