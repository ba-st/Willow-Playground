initialization
panelContentFor: aMethod

	| tabsBuilder |

	tabsBuilder := self componentSupplier tabsBuilder.

	tabsBuilder addTabHeadedBy: 'Source' containing: (self sourceCodeFor: aMethod).
	aMethod comment
		ifNotEmpty: [ tabsBuilder
				addTabHeadedBy: 'Comment'
				containing: [ :canvas | 
					canvas
						break;
						blockquote: aMethod comment ] ].
	^ tabsBuilder
		addTabHeadedBy: 'Bytecode' containing: (self symbolicBytecodesFor: aMethod);
		build