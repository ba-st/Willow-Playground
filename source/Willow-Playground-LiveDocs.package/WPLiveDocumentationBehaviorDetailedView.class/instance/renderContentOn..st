rendering
renderContentOn: html

	self session applicationContext
		withSelectedBehaviorDo: [ :behavior | 
			behavior isTrait
				ifTrue: [ self renderTrait: behavior on: html ]
				ifFalse: [ self renderClass: behavior on: html ] ]
		ifNone: [ html render: 'Nothing' ]