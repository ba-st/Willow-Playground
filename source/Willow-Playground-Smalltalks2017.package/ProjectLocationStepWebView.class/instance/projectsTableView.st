private-accessing
projectsTableView

	| tableBuilder projectTable |

	tableBuilder := self componentSupplier tableBuilder.
	tableBuilder
		addColumnTitled: 'Project' rendering: [ :info | info at: 1 ];
		addColumnTitled: 'Content' rendering: [ :info | info at: 2 ];
		addColumnTitled: 'Status' rendering: [ :info | info at: 3 ];
		addUntitledColumnRendering: [ :info | self componentSupplier asynchronicAnchorLabeled: (info at: 4) applying: [ :theAnchor |  ] ].
	projectTable := tableBuilder buildApplying: [ :table | table addClass bootstrap small ].

	projectTable changeContentsTo: self projectsWithLocations.
	^ projectTable