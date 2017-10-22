initialization
initializeTable

	table := TableWebViewBuilder new
	  addColumnTitled: 'Decimal' rendering: [ :number | number ];
	  addColumnTitled: 'Hex' rendering: [ :number | number printStringHex ];
	  addColumnTitled: 'Roman' rendering: [ :number | number printStringRoman ];
	  buildApplying: [ :theTable | theTable addClass bootstrap table ].
	table changeContentsTo: #(26 51 78)