rendering
renderContentOn: aCanvas

	| grid |

	grid := self componentSupplier gridBuilder
		columnsWidths: #(5 2 5);
		addContent: '';
		addContent: self willowLogoView;
		addContent:
				[ :canvas | canvas strong: 'Willow is a library used to reify interactive web applications' ];
		build.
	aCanvas render: grid.
	self renderSourceOf: #loadWillowFromGitHubCode on: aCanvas.
	self renderSourceOf: #loadWillowPlaygroundFromGitHubCode on: aCanvas