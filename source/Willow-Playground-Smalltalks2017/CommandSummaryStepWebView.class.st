"
I'm a step showing a command summary.
"
Class {
	#name : #CommandSummaryStepWebView,
	#superclass : #PresentationStepWebView,
	#category : #'Willow-Playground-Smalltalks2017-WebViews'
}

{ #category : #'private-accessing' }
CommandSummaryStepWebView >> anchorToBrowse: method [

	| anchor |

	anchor := AsynchronicAnchorWebView labeled: method selector.
	anchor onTrigger evaluate: [ method browse ].
	^ anchor
]

{ #category : #'private-accessing' }
CommandSummaryStepWebView >> availableCommands [

	^ WebComponentCommandBuilder localMethods
		sorted: [ :a :b | a selector <= b selector ]
]

{ #category : #accessing }
CommandSummaryStepWebView >> description [

	^ 'There are many commands to choose from'
]

{ #category : #rendering }
CommandSummaryStepWebView >> renderContentOn: aCanvas [

	| anchors list |

	anchors := self availableCommands collect: [ :method | self anchorToBrowse: method ].

	list := UnorderedListWebView
		applying: [ :theList |  ]
		listing: anchors
		applyingToEach: [ :theItem |  ].

	self renderPanelWrapping: list on: aCanvas
]

{ #category : #accessing }
CommandSummaryStepWebView >> shortName [

	^ 'Command Summary'
]
