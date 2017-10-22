private-accessing
projectsTableView

	| tableBuilder table |

	tableBuilder := self componentSupplier tableBuilder.
	tableBuilder
		addColumnTitled: 'Project' rendering: [ :info | info at: 1 ];
		addColumnTitled: 'Content' rendering: [ :info | info at: 2 ];
		addColumnTitled: 'Location'
			rendering:
				[ :info | self componentSupplier asynchronicAnchorLabeled: (info at: 3) applying: [ :theAnchor |  ] ].
	table := tableBuilder build.

	table changeContentsTo: self projectsWithLocations.
	^ table