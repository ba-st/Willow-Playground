private
renderMethodsIn: aBehavior on: html

	(aBehavior methods sorted: [ :a :b | a selector < b selector ])
		select: [ :method | method isExtension not and: [ (method protocol includesSubstring: 'private') not ] ]
		thenDo: [ :method | html render: (WPLiveDocumentationMethod for: method) ]