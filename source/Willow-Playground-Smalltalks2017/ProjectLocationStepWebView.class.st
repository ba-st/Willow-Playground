"
I'm a step showing the related projects and his locations.
"
Class {
	#name : #ProjectLocationStepWebView,
	#superclass : #PresentationStepWebView,
	#category : #'Willow-Playground-Smalltalks2017-WebViews'
}

{ #category : #'private-accessing' }
ProjectLocationStepWebView >> contactFieldSet [

	^ self componentSupplier gridBuilder
		addContent: self gabrielCard;
		addContent: self maxiCard;
		build
]

{ #category : #accessing }
ProjectLocationStepWebView >> description [

	^ 'Download Willow today!'
]

{ #category : #'private-accessing' }
ProjectLocationStepWebView >> gabrielCard [

	^ SpeakerCardWebView
		for: 'Gabriel Omar Cotelli'
		avatarLocatedAt: 'https://s.gravatar.com/avatar/e6e2cc60bac4aa512ecb68a391b1f3e9?s=80'
		academicDegree: 'B.Comp.'
		email: 'g.cotelli'
		githubUser: 'gcotelli'
]

{ #category : #'private-accessing' }
ProjectLocationStepWebView >> gitHubImageView [

	^ ImageWebView
		locatedAt: Smalltalks2017FileMetadataLibrary / #gitHubMark32pxPng
		applying: [ :image | image setStyleTo: [ :style | style width: 22 px ] ]
]

{ #category : #'private-accessing' }
ProjectLocationStepWebView >> maxiCard [

	^ SpeakerCardWebView
		for: 'Maximiliano Tabacman'
		avatarLocatedAt: 'https://s.gravatar.com/avatar/2b6ca6391139ddaa462781e339bbf060?s=80'
		academicDegree: 'Ph.D.'
		email: 'm.tabacman'
		githubUser: 'mtabacman'
]

{ #category : #'private-accessing' }
ProjectLocationStepWebView >> projectsTableView [

	| tableBuilder projectTable |

	tableBuilder := self componentSupplier tableBuilder.
	tableBuilder
		addColumn: [ :column | 
			column
				titled: 'Project';
				rendering: [ :info | info at: 1 ]
			];
		addColumn: [ :column | 
			column
				titled: 'Content';
				rendering: [ :info | info at: 2 ]
			];
		addColumn: [ :column | 
			column
				titled: 'Status';
				rendering: [ :info | info at: 3 ]
			];
		addColumn: [ :column | 
			column
				rendering: [ :info | 
					self componentSupplier
						asynchronicLinkLabeled: ( info at: 4 )
						applying:
							( OpenLocationCommand
								forNewBrowsingContextNavigatingTo: ( 'https://github.com/<1s>' expandMacrosWith: ( info at: 4 ) ) )
					]
			].
	projectTable := tableBuilder buildApplying: [ :table | table addClass bootstrap3 tableCondensed ].

	projectTable changeContentsTo: self projectsWithLocations.
	^ projectTable
]

{ #category : #'private-accessing' }
ProjectLocationStepWebView >> projectsWithLocations [

	^ Array
		with:
			{'Willow'.
			'Core features, components and commands'.
			self stableLabel.
			'ba-st/Willow'}
		with:
			{'Willow-Bootstrap'.
			'Bootstrap 3/4 components and plugins'.
			self stableLabel.
			'ba-st/Willow-Bootstrap'}
		with:
			{'Willow-JQueryUI'.
			'JQueryUI components'.
			self stableLabel.
			'ba-st/Willow-JQueryUI'}
		with:
			{'Willow-SemanticUI'.
			'SemanticUI components'.
			self workInProgressLabel.
			'ba-st/Willow-SemanticUI'}
		with:
			{'Willow-SpinKit'.
			'Spinner components (SpinKit)'.
			self stableLabel.
			'ba-st/Willow-SpinKit'}
		with:
			{'Willow-Playground'.
			'This presentation, Test Runner and Live Docs applications'.
			self stableLabel.
			'ba-st/Willow-Playground'}
]

{ #category : #rendering }
ProjectLocationStepWebView >> renderContentOn: aCanvas [

	aCanvas
		render:
			(HeadingWebView
				displaying: [ :html | 
					html
						render: 'Willow and it''s related projects are part of the web stack ecosystem hosted at '.
					html anchor
						url: 'https://github.com/ba-st';
						with: [ html
								render: self gitHubImageView;
								strong: '/ba-st' ] ]
				withLevel: 3).
	aCanvas render: self projectsTableView.

	aCanvas render: self contactFieldSet
]

{ #category : #accessing }
ProjectLocationStepWebView >> shortName [

	^ 'Project Location'
]

{ #category : #'private-accessing' }
ProjectLocationStepWebView >> stableLabel [

	^ self componentSupplier
		inlineContainerWrapping: 'STABLE'
		applying: [ :span | span addClass bootstrap3 label + span addClass bootstrap3 labelSuccess ]
]

{ #category : #'private-accessing' }
ProjectLocationStepWebView >> workInProgressLabel [

	^ self componentSupplier
		inlineContainerWrapping: 'WIP'
		applying: [ :span | span addClass bootstrap3 label + span addClass bootstrap3 labelWarning ]
]
