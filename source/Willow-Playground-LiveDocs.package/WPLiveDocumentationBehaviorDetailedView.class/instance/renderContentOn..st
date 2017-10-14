rendering
renderContentOn: html

	self session applicationContext withSelectedBehaviorDo: [ :behavior | html render: (self nameHeaderFor: behavior) ] ifNone: [ html render: 'Nothing' ]