private
headingRendering: aRenderable

	^ HeadingWebView displaying: aRenderable withLevel: 4 applying: [ :heading | heading addClass bootstrap textInfo ]