rendering
renderGarbageCollectionStatsOn: html

	self
		renderFullWithRowOn: html
		with: [ html
				render: (self headingRendering: 'Garbage Collection Stats');
				text: (String streamContents: [ :s | tally reportGCStatsOn: s ]) ]