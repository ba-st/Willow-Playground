rendering
renderLeavesOn: html

	| dict table |

	html render: (self headingRendering: 'Leaves').

	table := self componentSupplier tableBuilder
		addColumnTitled: 'Percent' rendering: [ :node | Percentage ratio: (node tally / tally tally asScaledDecimal: 1) ];
		addColumnTitled: 'Time (ms)'
			rendering: [ :node | ((Percentage ratio: node tally / tally tally) * tally time) rounded ]
			applyingToCells: [ :cell | cell addClass bootstrap textRight ]
			applyingToHeading: [  ];
		addColumnTitled: 'Class' rendering: [ :node | node method methodClass ];
		addColumnTitled: 'Selector' rendering: [ :node | node method selector ];
		build.

	dict := IdentityDictionary new: 100.
	tally leavesInto: dict fromSender: nil.
	table changeContentsTo: dict asSortedCollection.

	html render: table