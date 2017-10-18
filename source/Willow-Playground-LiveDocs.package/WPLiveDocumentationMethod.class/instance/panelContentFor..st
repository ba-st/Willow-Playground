initialization
panelContentFor: aMethod

	| tabsBuilder |

	tabsBuilder := self componentSupplier tabsBuilder.

	tabsBuilder addTabHeadedBy: 'Source' containing: (self sourceCodeFor: aMethod).
	aMethod comment
		ifNotNil: [ :comment | 
			tabsBuilder
				addTabHeadedBy: 'Comment'
				containing: [ :canvas | 
					canvas
						break;
						blockquote: comment ] ].
	^ tabsBuilder
		addTabHeadedBy: 'Bytecode' containing: (self symbolicBytecodesFor: aMethod);
		build