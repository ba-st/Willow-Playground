rendering
renderGarbageCollectionStatsOn: html

	self
		renderFullWithRowOn: html
		with: [ html
				render: (HeadingWebView displaying: 'Garbage Collection Stats' withLevel: 4 applying: [ :heading | heading addClass bootstrap textInfo + heading addClass bootstrap textLeft ]);
				text: (String streamContents: [ :s | tally reportGCStatsOn: s ]) ]