rendering
renderTreeOn: html

	html render: (self headingRendering: 'Tree').
	html render: (self unorderedListRendering: rootTally receivers)