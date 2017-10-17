initialization
sourceCodeFor: aMethod

	^ [ :canvas | 
	canvas
		break;
		preformatted: [ canvas
				code:
					('<1s><n><n><2s>'
						expandMacrosWith: aMethod ast selectorAndArgumentNames
						with: aMethod ast body formattedCode) ] ]