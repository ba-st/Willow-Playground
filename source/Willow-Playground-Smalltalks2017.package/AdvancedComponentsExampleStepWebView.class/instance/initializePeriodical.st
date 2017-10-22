initialization
initializePeriodical

	periodical := PeriodicallyRenderedWebView
		evaluating: [  ]
		every: 1000 millisecondsThenRendering:
			[ :canvas | canvas
				render: 'The time now is ';
				strong: self currentTime ]
		until: [ false ]