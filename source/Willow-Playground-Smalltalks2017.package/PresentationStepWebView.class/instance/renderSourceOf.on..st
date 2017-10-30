private-rendering
renderSourceOf: aSelector on: aCanvas

	| sourceCodeString |

	sourceCodeString := self class sourceCodeAt: aSelector.
	sourceCodeString := sourceCodeString copyAfter: Character cr.
	aCanvas preformatted
		class: 'smalltalk';
		with: [ aCanvas code: sourceCodeString ].

	aCanvas document
		addLoadScript:
			(JSStream
				on:
					'$("pre code").each(function(i, block) {
    hljs.highlightBlock(block);
  });')