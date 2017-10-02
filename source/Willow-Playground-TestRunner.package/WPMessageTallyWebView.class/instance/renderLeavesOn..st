rendering
renderLeavesOn: html

	| leavesTable |

	html render: (self headingRendering: 'Leaves').

	leavesTable := self componentSupplier tableBuilder
		addColumnTitled: 'Percent'
			rendering: [ :node | self percentageFor: node ]
			applyingToCells: [ :cell | cell addClass bootstrap textRight ]
			applyingToHeading: [  ];
		addColumnTitled: 'Time (ms)'
			rendering: [ :node | self timeFor: node ]
			applyingToCells: [ :cell | cell addClass bootstrap textRight ]
			applyingToHeading: [  ];
		addColumnTitled: 'Class' rendering: [ :node | [ :canvas | canvas strong: node method methodClass ] ];
		addColumnTitled: 'Selector' rendering: [ :node | node method selector ];
		buildApplying: [ :table | table addClass bootstrap small ].

	leavesTable changeContentsTo: self tallyLeavesSorted.

	html render: leavesTable