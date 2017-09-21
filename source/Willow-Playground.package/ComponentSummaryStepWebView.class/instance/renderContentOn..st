rendering
renderContentOn: aCanvas

	| dropdown checkbox image |

	dropdown := DropDownListWebView
		applying: (ListLabelingCommand with: [ :element | element reverse ]).
	dropdown allowAnyOf: #('Smartphone' 'Tablet' 'Destkop' 'Notebook' 'Arduino').
	aCanvas render: dropdown.

	checkbox := CheckboxWebView
		labeled: 'Make a choice'
		onModel: 10
		offModel: -10
		applying: CompositeComponentCommand empty.
	aCanvas render: checkbox.

	image := ImageWebView
		locatedAt: 'https://upload.wikimedia.org/wikipedia/en/c/c0/Smalltalk80book.jpg'
		applying: CompositeComponentCommand empty.
	aCanvas render: image