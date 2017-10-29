initialization
initializeDropDownListView
	dropdown := DropDownListWebView applying: [ :theDropdown |  ].
	
	dropdown allowAnyOf:
		#('Smartphone' 'Tablet' 'Destkop' 'Notebook' 'Arduino')