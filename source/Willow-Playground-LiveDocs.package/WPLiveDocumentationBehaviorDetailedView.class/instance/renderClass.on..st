private
renderClass: aClass on: html

	html
		render: (self classNameHeaderFor: aClass);
		render: (WPLiveDocumentationClassHiearchy for: aClass);
		render: (WPLiveDocumentationClassDefinition for: aClass);
		render: (WPLiveDocumentationClassComment for: aClass);
		render: (HeadingWebView displaying: 'Class methods' withLevel: 3).
	self renderMethodsIn: aClass class on: html.
	html render: (HeadingWebView displaying: 'Instance methods' withLevel: 3).
	self renderMethodsIn: aClass on: html