rendering
renderGarbageCollectionStatsOn: html

	self
		renderFullWithRowOn: html
		with: [ html render: (self headingRendering: 'Garbage Collection Stats').
			((String streamContents: [ :s | rootTally reportGCStatsOn: s ]) splitOn: Character cr) do: [ :line | html text: line ] separatedBy: [ html break ] ]