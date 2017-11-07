rendering
renderContentOn: aCanvas

	| grid |

	grid := self componentSupplier gridBuilder
		columnsWidths: #(2 10);
		applyingToCells: [ :cell :constants | cell setStyleTo: [ :style | style textAlign: constants css justify ] ];
		addContent: self willowLogoView;
		addContent: [ :html | 
			html
				strong: 'Willow is a Web Interaction Library that eases the burden of creating AJAX-based web applications.';
				break;
				break;
				render: 'It''s built on top of the Seaside Web Framework providing a set of composable components, easier AJAX interaction and licensed under MIT.' ];
		build.
	aCanvas
		render: grid;
		break;
		render:
			(self componentSupplier
				fieldSetContaining: [ :html | 
					self renderSourceOf: #loadWillowFromGitHubCode on: html.
					self renderSourceOf: #loadWillowPlaygroundFromGitHubCode on: html ]
				applying: [  ]
				withLegend: 'Get Started!'
				applying: [  ])