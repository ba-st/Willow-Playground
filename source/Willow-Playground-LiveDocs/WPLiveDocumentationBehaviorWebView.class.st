"
í'm a web view showing the details for a class or trait
"
Class {
	#name : #WPLiveDocumentationBehaviorWebView,
	#superclass : #WAPainter,
	#category : #'Willow-Playground-LiveDocs-WebViews'
}

{ #category : #private }
WPLiveDocumentationBehaviorWebView >> buttonToBrowse: aBehavior [

	| browseButton |

	browseButton := self componentSupplier
		asynchronicLinkActingAsButtonLabeled: 'Open Browser'
		applying: [ :button | button addClass bootstrap buttonPrimary + button addClass bootstrap pullRight ].
	browseButton onTrigger evaluate: [ aBehavior browse ].
	^ browseButton
]

{ #category : #private }
WPLiveDocumentationBehaviorWebView >> classNameHeaderFor: aClass [

	^ HeadingWebView
		displaying: [ :html | 
			html
				render: aClass name;
				space.
			html span with: 'CLASS' applying: [ :span | span addClass bootstrap badge ].
			html render: (self buttonToBrowse: aClass) ]
		withLevel: 2
]

{ #category : #private }
WPLiveDocumentationBehaviorWebView >> emptyPlaceholder [

	^ self componentSupplier notificationBuilder
		informational;
		wrapping: [ :canvas | 
			canvas
				render: (Bootstrap3IconWebView representing: Glyphicons exclamationSign);
				space;
				strong: 'Hey! Looks like you don''t selected anything yet.';
				break;
				break;
				render: 'Give it a try to the left panel. Select a package and later a behavior to view it''s details.';
				space;
				strong: (Bootstrap3IconWebView representing: Glyphicons thumbsUp) ];
		build
]

{ #category : #private }
WPLiveDocumentationBehaviorWebView >> renderClass: aClass on: html [

	html
		render: (self classNameHeaderFor: aClass);
		render: (WPLiveDocumentationClassCommentWebView for: aClass);
		render: (WPLiveDocumentationClassHierarchyCard for: aClass);
		render: (WPLiveDocumentationClassDefinitionCard for: aClass);
		render: (HeadingWebView displaying: 'Class methods' withLevel: 3).
	self renderMethodsIn: aClass class on: html.
	html render: (HeadingWebView displaying: 'Instance methods' withLevel: 3).
	self renderMethodsIn: aClass on: html
]

{ #category : #rendering }
WPLiveDocumentationBehaviorWebView >> renderContentOn: html [

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
WPLiveDocumentationBehaviorWebView >> renderMethodsIn: aBehavior on: html [

	(aBehavior methods sorted: [ :a :b | a selector < b selector ])
		select: [ :method | method isExtension not and: [ (method protocol includesSubstring: 'private') not ] ]
		thenDo: [ :method | html render: (WPLiveDocumentationMethodCard for: method) ]
]

{ #category : #private }
WPLiveDocumentationBehaviorWebView >> renderTrait: trait on: html [

	html
		render: (self traitNameHeaderFor: trait);
		render: (HeadingWebView displaying: 'Methods' withLevel: 3).
	self renderMethodsIn: trait on: html
]

{ #category : #private }
WPLiveDocumentationBehaviorWebView >> traitNameHeaderFor: aTrait [

	^ HeadingWebView
		displaying: [ :html | 
			html
				render: aTrait name;
				space.
			html span with: 'TRAIT' applying: [ :span | span addClass bootstrap badge ] ]
		withLevel: 2
]
