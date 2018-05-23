Extension { #name : #ComponentClassificationCommandBuilder }

{ #category : #'*Willow-Playground-Smalltalks2017' }
ComponentClassificationCommandBuilder >> browseStep [

	^ self commandStyledWith: #browseStep
]

{ #category : #'*Willow-Playground-Smalltalks2017' }
ComponentClassificationCommandBuilder >> nextStep [

	^ self commandStyledWith: #nextStep
]

{ #category : #'*Willow-Playground-Smalltalks2017' }
ComponentClassificationCommandBuilder >> presentationArea [

	^ self commandStyledWith: #presentationArea
]

{ #category : #'*Willow-Playground-Smalltalks2017' }
ComponentClassificationCommandBuilder >> previousStep [

	^ self commandStyledWith: #previousStep
]

{ #category : #'*Willow-Playground-Smalltalks2017' }
ComponentClassificationCommandBuilder >> screenshot [

	^ self commandStyledWith: #screenshot
]

{ #category : #'*Willow-Playground-Smalltalks2017' }
ComponentClassificationCommandBuilder >> smalltalks2017 [

	classesProvider := classesProvider >> #smalltalks2017
]
