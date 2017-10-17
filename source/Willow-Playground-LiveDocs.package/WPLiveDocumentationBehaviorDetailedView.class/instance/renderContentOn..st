rendering
renderContentOn: html

	self session applicationContext
		withSelectedBehaviorDo: [ :behavior | 
			behavior isTrait
				ifTrue: [ html render: (self traitNameHeaderFor: behavior) ]
				ifFalse: [ html
						render: (self classNameHeaderFor: behavior);
						render: (WPLiveDocumentationClassHiearchy for: behavior);
						render: (WPLiveDocumentationClassDefinition for: behavior);
						render: (WPLiveDocumentationClassComment for: behavior) ] ]
		ifNone: [ html render: 'Nothing' ]