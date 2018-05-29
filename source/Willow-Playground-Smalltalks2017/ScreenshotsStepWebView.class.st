"
I'm a step showing real apps screenshots.
"
Class {
	#name : #ScreenshotsStepWebView,
	#superclass : #PresentationStepWebView,
	#category : #'Willow-Playground-Smalltalks2017-WebViews'
}

{ #category : #'private-accessing' }
ScreenshotsStepWebView >> abbacoScreenshot [

	^ self screenshotFor: #abbacoPng describedBy: 'Abbaco'
]

{ #category : #accessing }
ScreenshotsStepWebView >> description [

	^ 'Real applications using Willow'
]

{ #category : #'private-accessing' }
ScreenshotsStepWebView >> eraForRolemasterScreenshot [

	^ self screenshotFor: #eraJpg describedBy: 'ERA for Rolemaster'
]

{ #category : #'private-accessing' }
ScreenshotsStepWebView >> orderManagementScreenshot [

	^ self screenshotFor: #omPng describedBy: 'Mercap Order Management'
]

{ #category : #'private-accessing' }
ScreenshotsStepWebView >> portfolioScreenshot [

	^ self screenshotFor: #portfolioPng describedBy: 'Mercap Portfolio'
]

{ #category : #rendering }
ScreenshotsStepWebView >> renderContentOn: aCanvas [

	self
		renderCarouselWithAll:
			{self eraForRolemasterScreenshot.
			self abbacoScreenshot.
			self tradingRoomScreenshot.
			self orderManagementScreenshot.
			self portfolioScreenshot}
		on: aCanvas
]

{ #category : #'private-accessing' }
ScreenshotsStepWebView >> screenshotFor: aSymbol describedBy: aCaption [

	^ [ :html | 
	html render: (ImageWebView locatedAt: Smalltalks2017FileMetadataLibrary / aSymbol applying: [ :theImage | theImage addClass smalltalks2017 screenshot ]).
	html div
		class: 'carousel-caption';
		setStyleTo: [ :style :constants | 
			style
				color: constants >> #colors >> #black;
				paddingBottom: 0 ];
		with: aCaption ]
]

{ #category : #accessing }
ScreenshotsStepWebView >> shortName [

	^ 'Applications'
]

{ #category : #'private-accessing' }
ScreenshotsStepWebView >> tradingRoomScreenshot [

	^ self screenshotFor: #tradingRoomJpg describedBy: 'Mercap Trading Room'
]
