private-utility
start

	Smalltalks2017Presentation registerAsDevelopmentApplication.
	WPTestRunner registerAsDevelopmentApplication.
	WPLiveDocumentation registerAsDevelopmentApplication.
	(ZnZincServerAdaptor port: 8080)
		codec: GRPharoUtf8Codec new;
		start