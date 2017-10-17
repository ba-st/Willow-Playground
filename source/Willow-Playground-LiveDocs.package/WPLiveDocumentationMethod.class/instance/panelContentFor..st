initialization
panelContentFor: aMethod

	^ self componentSupplier tabsBuilder
		addTabHeadedBy: 'Source'
			containing: [ :canvas | 
			canvas
				break;
				preformatted: [ canvas
						code: ('<1s><n><n><2s>' expandMacrosWith: aMethod ast selectorAndArgumentNames with: aMethod ast body formattedCode) ] ];
		addTabHeadedBy: 'Comment'
			containing: [ :canvas | 
			canvas
				break;
				blockquote: aMethod comment ];
		addTabHeadedBy: 'Bytecode'
			containing: [ :canvas | 
			canvas
				break;
				preformatted: [ canvas
						code:
							(String
								streamContents: [ :stream | aMethod symbolicBytecodes do: [ :bytecode | stream nextPutAll: bytecode greaseString ] separatedBy: [ stream cr ] ]) ] ];
		build