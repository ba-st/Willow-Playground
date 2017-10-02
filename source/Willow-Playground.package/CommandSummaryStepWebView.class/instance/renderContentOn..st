rendering
renderContentOn: aCanvas

	| tableBuilder table |

	tableBuilder := TableWebViewBuilder new.
	tableBuilder
		addColumnTitled: 'Selector' rendering: [ :selector | selector ];
		addColumnTitled: 'Example'
			rendering: [ :selector | 'Test, example, input for example, button to inspect source?' ].
	table := tableBuilder buildApplying: [ :theTable |  ].

	table changeContentsTo: WebComponentCommandBuilder localSelectors.

	aCanvas render: table