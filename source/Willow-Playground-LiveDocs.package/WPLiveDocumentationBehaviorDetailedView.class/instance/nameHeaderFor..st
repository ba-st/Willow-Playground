rendering
nameHeaderFor: behavior

	^ HeadingWebView
		displaying: [ :canvas | 
			canvas
				render: behavior name;
				space;
				render:
					(PhrasingContainerWebView
						wrapping:
							(behavior isTrait
								ifTrue: [ 'TRAIT' ]
								ifFalse: [ 'CLASS' ])
						applying: [ :span | span addClass bootstrap badge ]) ]
		withLevel: 2