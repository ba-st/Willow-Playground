private
classNameHeaderFor: aClass

	^ HeadingWebView
		displaying: [ :canvas | 
			canvas
				render: aClass name;
				space;
				render: (PhrasingContainerWebView wrapping: 'CLASS' applying: [ :span | span addClass bootstrap badge ]) ]
		withLevel: 2