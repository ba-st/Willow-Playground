rendering
renderContentOn: html

	self session applicationContext
		withSelectedBehaviorDo: [ :behavior | 
			html
				render: (self nameHeaderFor: behavior);
				render: (WPLiveDocumentationClassHiearchy for: behavior);
				render: (WPLiveDocumentationClassDefinition for: behavior);
				render: (WPLiveDocumentationClassComment for: behavior) ]
		ifNone: [ html render: 'Nothing' ]