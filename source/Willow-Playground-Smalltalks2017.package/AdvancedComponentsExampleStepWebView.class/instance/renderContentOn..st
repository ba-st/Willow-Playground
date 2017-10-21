rendering
renderContentOn: aCanvas

	| delayed periodical tableBuilder table |

	tableBuilder := TableWebViewBuilder new.
	tableBuilder
		addColumnTitled: 'Decimal' rendering: [ :number | number ];
		addColumnTitled: 'Hex' rendering: [ :number | number printStringHex ];
		addColumnTitled: 'Roman' rendering: [ :number | number printStringRoman ].
	table := tableBuilder buildApplying: [ :theTable | theTable addClass bootstrap table ].

	table changeContentsTo: #(1 13 26 51 78 111).

	periodical := PeriodicallyRenderedWebView
		evaluating: [  ]
		every: 1000
		millisecondsThenRendering: [ :canvas | 
			canvas
				render: 'The time now is ';
				strong: (GRPrinter isoTime print: Time now) ]
		until: [ false ].

	delayed := DelayedViewRenderer
		showing: SpinKitCubeGrid new
		whileEvaluating: [ (Delay forSeconds: 2) wait ]
		thenRendering: [ :canvas | 
			canvas
				render: periodical;
				render: table ].

	aCanvas render: delayed