private
renderMethodsIn: aClass on: html

	(aClass methods sorted: [ :a :b | a selector < b selector ])
		select: [ :method | method isExtension not and: [ (method protocol includesSubstring: 'private') not ] ]
		thenDo: [ :method | html render: (WPLiveDocumentationMethod for: method) ]