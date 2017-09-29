private
rowWrapping: aRenderable

	^ GenericContainerWebView
		wrapping:
			(GenericContainerWebView
				wrapping: aRenderable
				applying: [ :div | (div addClass bootstrap columnExtraSmall: 12) + (div addClass bootstrap columnSmall: 12) + (div addClass bootstrap columnMedium: 12) + (div addClass bootstrap columnLarge: 12) ])
		applying: [ :div | div addClass bootstrap row ]