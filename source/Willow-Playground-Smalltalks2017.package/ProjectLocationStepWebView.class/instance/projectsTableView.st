private-accessing
projectsTableView

	| tableBuilder projectTable |

	tableBuilder := self componentSupplier tableBuilder.
	tableBuilder
		addColumnTitled: 'Project' rendering: [ :info | info at: 1 ];
		addColumnTitled: 'Content' rendering: [ :info | info at: 2 ];
		addColumnTitled: 'Status' rendering: [ :info | info at: 3 ];
		addUntitledColumnRendering: [ :info | self componentSupplier asynchronicLinkLabeled: (info at: 4) applying: (OpenLocationCommand forNewBrowsingContextNavigatingTo: ('https://github.com/<1s>' expandMacrosWith: (info at: 4))) ].
	projectTable := tableBuilder buildApplying: [ :table | table addClass bootstrap tableCondensed ].

	projectTable changeContentsTo: self projectsWithLocations.
	^ projectTable