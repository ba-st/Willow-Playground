rendering
renderLeavesOn: html

	| leavesTable |

	html render: (self headingRendering: 'Leaves').

	leavesTable := self componentSupplier tableBuilder
		addColumnTitled: 'Percent'
			rendering: [ :node | self formattedPercentagFor: node ]
			applyingToCells: [ :cell | cell addClass bootstrap textRight ]
			applyingToHeading: [  ];
		addColumnTitled: 'Time (ms)'
			rendering: [ :node | self timeFor: node ]
			applyingToCells: [ :cell | cell addClass bootstrap textRight ]
			applyingToHeading: [  ];
		addColumnTitled: 'Class' rendering: [ :node | [ :canvas | canvas strong: node method methodClass ] ];
		addColumnTitled: 'Selector' rendering: [ :node | node method selector ];
		build.

	leavesTable changeContentsTo: self tallyLeavesSorted.

	self renderBoundedContainerWrapping: leavesTable on: html upTo: 20 vh