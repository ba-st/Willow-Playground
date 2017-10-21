private
csssmalltalks2017CssContent

	^ String
		streamContents: [ :stream | Smalltalks2017CascadingStyleSheetBuilder new build printOn: stream ]