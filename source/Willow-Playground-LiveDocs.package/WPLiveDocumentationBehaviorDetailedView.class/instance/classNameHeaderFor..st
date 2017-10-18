private
classNameHeaderFor: aClass

	^ HeadingWebView
		displaying: [ :canvas | 
			canvas
				render: aClass name;
				space;
				render: (PhrasingContainerWebView wrapping: 'CLASS' applying: [ :span | span addClass bootstrap badge ]).
			canvas render: (self buttonToBrowse: aClass) ]
		withLevel: 2