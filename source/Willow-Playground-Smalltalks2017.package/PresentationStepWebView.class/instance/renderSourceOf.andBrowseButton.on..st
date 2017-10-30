private-rendering
renderSourceOf: aSelector andBrowseButton: aButtonOptional on: aCanvas

	| sourceCodeString |

	sourceCodeString := self class sourceCodeAt: aSelector.
	sourceCodeString := sourceCodeString copyAfter: Character cr.
	aCanvas preformatted
		class: 'smalltalk';
		with: [ aButtonOptional withContentDo: [ :button | aCanvas render: button ].
			aCanvas code: sourceCodeString ].

	aCanvas document
		addLoadScript:
			(JSStream
				on:
					'$("pre code").each(function(i, block) {
    hljs.highlightBlock(block);
  });')