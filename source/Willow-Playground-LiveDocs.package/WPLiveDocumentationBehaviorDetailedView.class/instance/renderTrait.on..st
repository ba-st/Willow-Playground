private
renderTrait: trait on: html

	html
		render: (self traitNameHeaderFor: trait);
		render: (HeadingWebView displaying: 'Methods' withLevel: 3).
	self renderMethodsIn: trait on: html