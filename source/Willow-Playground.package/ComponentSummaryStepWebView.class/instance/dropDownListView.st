private-accessing
dropDownListView

	| dropdown |

	dropdown := DropDownListWebView
		applying: [ :theDropdown | theDropdown labelItemsWith: [ :element | element reverse ] ].
	dropdown allowAnyOf: #('Smartphone' 'Tablet' 'Destkop' 'Notebook' 'Arduino').
	^ dropdown