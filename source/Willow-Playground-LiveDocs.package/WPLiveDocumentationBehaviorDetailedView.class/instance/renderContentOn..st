rendering
renderContentOn: html

	self session applicationContext
		withSelectedBehaviorDo: [ :behavior | 
			behavior isTrait
				ifTrue: [ html render: (self traitNameHeaderFor: behavior) ]
				ifFalse: [ self renderClass: behavior on: html ] ]
		ifNone: [ html render: 'Nothing' ]