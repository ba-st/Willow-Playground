rendering
renderContentOn: aCanvas

	| tableBuilder table |

	aCanvas
		div: [ aCanvas
				render: 'Hosted at the ';
				strong: 'ba-st';
				render: ' group in ';
				strong: 'GitHub' ].

	tableBuilder := self componentSupplier tableBuilder.
	tableBuilder
		addColumnTitled: 'Project' rendering: [ :info | info at: 1 ];
		addColumnTitled: 'Content' rendering: [ :info | info at: 2 ];
		addColumnTitled: 'Location'
			rendering:
				[ :info | self componentSupplier asynchronicAnchorLabeled: (info at: 3) applying: [ :theAnchor |  ] ].
	table := tableBuilder build.
	table
		changeContentsTo:
			(Array
				with: #('Willow' 'Core features, components, commands' 'https://github.com/ba-st/Willow')
				with:
					#('Willow-SpinKit' 'Spinner components (SpinKit)' 'https://github.com/ba-st/Willow-SpinKit')
				with:
					#('Willow-Bootstrap' 'Bootstrap component supplier' 'https://github.com/ba-st/Willow-Bootstrap')
				with:
					#('Willow-JQueryUI' 'JQueryUI component supplier' 'https://github.com/ba-st/Willow-JQueryUI')
				with:
					#('Willow-SemanticUI' 'SemanticUI component supplier' 'https://github.com/ba-st/Willow-SemanticUI')
				with:
					#('Willow-Playground' 'This presentation + Test Runner application' 'https://github.com/ba-st/Willow-Playground')).

	aCanvas render: table