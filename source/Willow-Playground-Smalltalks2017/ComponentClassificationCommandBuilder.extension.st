Extension { #name : #ComponentClassificationCommandBuilder }

{ #category : #'*Willow-Playground-Smalltalks2017-Smalltalks2017' }
ComponentClassificationCommandBuilder >> browseStep [

	^ self commandStyledWith: styleProviderBinding content browseStep
]

{ #category : #'*Willow-Playground-Smalltalks2017-Smalltalks2017' }
ComponentClassificationCommandBuilder >> nextStep [

	^ self commandStyledWith: styleProviderBinding content nextStep
]

{ #category : #'*Willow-Playground-Smalltalks2017-Smalltalks2017' }
ComponentClassificationCommandBuilder >> presentationArea [

	^ self commandStyledWith: styleProviderBinding content presentationArea
]

{ #category : #'*Willow-Playground-Smalltalks2017-Smalltalks2017' }
ComponentClassificationCommandBuilder >> previousStep [

	^ self commandStyledWith: styleProviderBinding content previousStep
]

{ #category : #'*Willow-Playground-Smalltalks2017-Smalltalks2017' }
ComponentClassificationCommandBuilder >> screenshot [

	^ self commandStyledWith: styleProviderBinding content screenshot
]

{ #category : #'*Willow-Playground-Smalltalks2017-Smalltalks2017' }
ComponentClassificationCommandBuilder >> smalltalks2017 [

	styleProviderBinding := Binding to: Smalltalks2017CssStyles
]
