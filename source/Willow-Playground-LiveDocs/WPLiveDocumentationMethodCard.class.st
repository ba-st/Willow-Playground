"
I'm a panel showing an specific method 
"
Class {
	#name : #WPLiveDocumentationMethodCard,
	#superclass : #WAPainter,
	#instVars : [
		'method',
		'methodPanel'
	],
	#category : #'Willow-Playground-LiveDocs-WebViews'
}

{ #category : #'instance creation' }
WPLiveDocumentationMethodCard class >> for: aMethod [

	^self new initializeFor: aMethod 
]

{ #category : #initialization }
WPLiveDocumentationMethodCard >> initializeFor: aMethod [

	method := aMethod.
	methodPanel := self componentSupplier panelBuilder
		headingDisplaying: [ :canvas | 
			canvas strong: aMethod selector.
			canvas
				render:
					(PhrasingContainerWebView
						wrapping: aMethod protocol
						applying: [ :badge | badge addClass bootstrap badge + badge addClass bootstrap pullRight ]) ];
		wrapping: (self panelContentFor: aMethod);
		buildApplying: [ :panel | panel addClass bootstrap panelDefault ]
]

{ #category : #initialization }
WPLiveDocumentationMethodCard >> panelContentFor: aMethod [

	| tabsBuilder |

	tabsBuilder := self componentSupplier tabsBuilder.

	tabsBuilder addTabHeadedBy: 'Source' containing: (self sourceCodeFor: aMethod).
	aMethod comment
		ifNotNil: [ :comment | 
			tabsBuilder
				addTabHeadedBy: 'Comment'
				containing: [ :canvas | 
					canvas
						break;
						blockquote: comment ] ].
	^ tabsBuilder
		addTabHeadedBy: 'Bytecode' containing: (self symbolicBytecodesFor: aMethod);
		build
]

{ #category : #initialization }
WPLiveDocumentationMethodCard >> renderContentOn: html [

	html render: methodPanel
]

{ #category : #initialization }
WPLiveDocumentationMethodCard >> sourceCodeFor: aMethod [

	^ [ :canvas | 
	canvas
		break;
		preformatted: [ canvas
				code:
					('<1s><n><n><2s>'
						expandMacrosWith: aMethod ast selectorAndArgumentNames
						with: aMethod ast body formattedCode) ] ]
]

{ #category : #initialization }
WPLiveDocumentationMethodCard >> symbolicBytecodesFor: aMethod [

	^ [ :canvas | 
	canvas
		break;
		preformatted: [ canvas
				code:
					(String
						streamContents: [ :stream | 
							aMethod symbolicBytecodes
								do: [ :bytecode | stream nextPutAll: bytecode greaseString ]
								separatedBy: [ stream cr ] ]) ] ]
]
