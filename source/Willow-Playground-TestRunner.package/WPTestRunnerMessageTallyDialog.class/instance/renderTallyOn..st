rendering
renderTallyOn: html

	self session applicationContext
		withMessageTallyDo: [ :tally | html render: (WPMessageTallyWebView for: tally) ]
		ifNone: [ html
				render: (BootstrapIconWebView representing: Glyphicons flash);
				space;
				render: 'Wow! That was fast... no time to take a tally' ]