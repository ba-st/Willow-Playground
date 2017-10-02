rendering
renderLeavesOn: html

	| table |

	html render: (self headingRendering: 'Leaves').

	table := self componentSupplier tableBuilder
		addColumnTitled: 'Percent'
			rendering: [ :node | Percentage ratio: (node tally / rootTally tally) asFloat ]
			applyingToCells: [ :cell | cell addClass bootstrap textRight ]
			applyingToHeading: [  ];
		addColumnTitled: 'Time (ms)'
			rendering: [ :node | ((Percentage ratio: node tally / rootTally tally) * rootTally time) rounded ]
			applyingToCells: [ :cell | cell addClass bootstrap textRight ]
			applyingToHeading: [  ];
		addColumnTitled: 'Class' rendering: [ :node | [ :canvas | canvas strong: node method methodClass ] ];
		addColumnTitled: 'Selector' rendering: [ :node | node method selector ];
		build.

	table changeContentsTo: self tallyLeavesSorted.

	html render: table