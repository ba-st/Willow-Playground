private
label: aText prependedBy: anIconClass

	^ [ :canvas | 
	canvas
		render: (BootstrapIconWebView representing: anIconClass);
		space;
		render: aText ]