private-rendering
renderSourceOf: aSelector on: aCanvas

	| sourceCodeString |

	sourceCodeString := self class sourceCodeAt: aSelector.
	sourceCodeString := sourceCodeString copyAfter: Character cr.
	sourceCodeString := sourceCodeString
		trimBoth: [ :char | char isSeparator and: [ char ~= Character tab ] ].
	sourceCodeString := '<1s><2s><1s><1s>'
		expandMacrosWith:
			'
'
		with: sourceCodeString.

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