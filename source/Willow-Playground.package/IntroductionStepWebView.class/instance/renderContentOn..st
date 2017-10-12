rendering
renderContentOn: aCanvas

	aCanvas preformatted
		class: 'smalltalk';
		script: (aCanvas javascript script: [ :script | script << 'hljs.highlightBlock(this)' ]);
		with: [ aCanvas
				code:
					'Metacello new
  baseline: ''Willow'';
  repository: ''github://ba-st/Willow:master/source'';
  load' ].

	aCanvas document
		addLoadScript:
			(JSStream
				on:
					'$("pre code").each(function(i, block) {
    hljs.highlightBlock(block);
  });')