private
renderClass: aClass on: html

	html
		render: (self classNameHeaderFor: aClass);
		render: (WPLiveDocumentationClassHiearchy for: aClass);
		render: (WPLiveDocumentationClassDefinition for: aClass);
		render: (WPLiveDocumentationClassComment for: aClass);
		render: (HeadingWebView displaying: 'Class methods' withLevel: 3).
	(aClass class methods sorted: [ :a :b | a selector < b selector ])
		select: [ :method | method isExtension not ]
		thenDo: [ :method | html render: (WPLiveDocumentationMethod for: method) ]