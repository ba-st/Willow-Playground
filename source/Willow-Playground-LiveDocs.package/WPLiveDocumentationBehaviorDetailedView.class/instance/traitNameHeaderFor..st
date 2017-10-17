private
traitNameHeaderFor: aTrait

	^ HeadingWebView
		displaying: [ :canvas | 
			canvas
				render: aTrait name;
				space;
				render: (PhrasingContainerWebView wrapping: 'TRAIT' applying: [ :span | span addClass bootstrap badge ]) ]
		withLevel: 2