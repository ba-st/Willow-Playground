private
renderMethodsIn: aClass on: html

	(aClass methods sorted: [ :a :b | a selector < b selector ])
		select: [ :method | method isExtension not ]
		thenDo: [ :method | html render: (WPLiveDocumentationMethod for: method) ]