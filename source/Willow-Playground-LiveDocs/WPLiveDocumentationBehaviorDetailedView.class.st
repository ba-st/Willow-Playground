"
í'm a web view showing the details for a class or trait
"
Class {
	#name : #WPLiveDocumentationBehaviorDetailedView,
	#superclass : #WAPainter,
	#category : 'Willow-Playground-LiveDocs'
}

{ #category : #private }
WPLiveDocumentationBehaviorDetailedView >> buttonToBrowse: aBehavior [

	| browseButton |

	browseButton := self componentSupplier
		asynchronicLinkActingAsButtonLabeled: 'Open Browser'
		applying: [ :button | button addClass bootstrap buttonPrimary + button addClass bootstrap pullRight ].
	browseButton onTrigger evaluate: [ aBehavior browse ].
	^ browseButton
]

{ #category : #private }
WPLiveDocumentationBehaviorDetailedView >> classNameHeaderFor: aClass [

	^ HeadingWebView
		displaying: [ :canvas | 
			canvas
				render: aClass name;
				space;
				render: (PhrasingContainerWebView wrapping: 'CLASS' applying: [ :span | span addClass bootstrap badge ]).
			canvas render: (self buttonToBrowse: aClass) ]
		withLevel: 2
]

{ #category : #private }
WPLiveDocumentationBehaviorDetailedView >> emptyPlaceholder [

	^ self componentSupplier notificationBuilder
		informational;
		wrapping: [ :canvas | 
			canvas
				render: (BootstrapIconWebView representing: Glyphicons exclamationSign);
				space;
				strong: 'Hey! Looks like you don''t selected anything yet.';
				break;
				break;
				render: 'Give it a try to the left panel. Select a package and later a behavior to view it''s details.';
				space;
				strong: (BootstrapIconWebView representing: Glyphicons thumbsUp) ];
		build
]

{ #category : #private }
WPLiveDocumentationBehaviorDetailedView >> renderClass: aClass on: html [

	html
		render: (self classNameHeaderFor: aClass);
		render: (WPLiveDocumentationClassComment for: aClass);
		render: (WPLiveDocumentationClassHiearchy for: aClass);
		render: (WPLiveDocumentationClassDefinition for: aClass);
		render: (HeadingWebView displaying: 'Class methods' withLevel: 3).
	self renderMethodsIn: aClass class on: html.
	html render: (HeadingWebView displaying: 'Instance methods' withLevel: 3).
	self renderMethodsIn: aClass on: html
]

{ #category : #rendering }
WPLiveDocumentationBehaviorDetailedView >> renderContentOn: html [

	self session applicationContext
		withSelectedBehaviorDo: [ :behavior | 
			behavior isTrait
				ifTrue: [ self renderTrait: behavior on: html ]
				ifFalse: [ self renderClass: behavior on: html ] ]
		ifNone: [ html
				break;
				render: self emptyPlaceholder ]
]

{ #category : #private }
WPLiveDocumentationBehaviorDetailedView >> renderMethodsIn: aBehavior on: html [

	(aBehavior methods sorted: [ :a :b | a selector < b selector ])
		select: [ :method | method isExtension not and: [ (method protocol includesSubstring: 'private') not ] ]
		thenDo: [ :method | html render: (WPLiveDocumentationMethod for: method) ]
]

{ #category : #private }
WPLiveDocumentationBehaviorDetailedView >> renderTrait: trait on: html [

	html
		render: (self traitNameHeaderFor: trait);
		render: (HeadingWebView displaying: 'Methods' withLevel: 3).
	self renderMethodsIn: trait on: html
]

{ #category : #private }
WPLiveDocumentationBehaviorDetailedView >> traitNameHeaderFor: aTrait [

	^ HeadingWebView
		displaying: [ :canvas | 
			canvas
				render: aTrait name;
				space;
				render: (PhrasingContainerWebView wrapping: 'TRAIT' applying: [ :span | span addClass bootstrap badge ]) ]
		withLevel: 2
]
