rendering
renderContentOn: aCanvas

	| delayed periodical tableBuilder table |

	tableBuilder := TableWebViewBuilder new.
	tableBuilder
		addColumnTitled: 'Selector' rendering: [ :method | method selector ];
		addColumnTitled: 'Source Code' rendering: [ :method | method sourceCode ].
	table := tableBuilder buildApplying: [ :theTable |  ].

	table changeContentsTo: WebComponentCommandBuilder localMethods.

	delayed := DelayedViewRenderer
		showing: SpinKitCubeGrid new
		whileEvaluating: [ (Delay forSeconds: 5) wait ]
		thenRendering: table.

	periodical := PeriodicallyRenderedWebView
		evaluating: [  ]
		every: 1000
		millisecondsThenRendering: [ :canvas | canvas strong: Time now seconds]
		until: [ false ].

	aCanvas
		render: periodical;
		render: delayed.

	aCanvas strong: 'algo con identified tambien? en otro slide?'