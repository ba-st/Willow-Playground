private-utility
stop

	ZnServer stopDefault.
	ZnZincServerAdaptor allInstancesDo: [ :each | each shutDown ].
	Smalltalks2017Presentation unregisterFromApplications.
	WPTestRunner unregisterFromApplications.
	WPLiveDocumentation unregisterFromApplications.
	Smalltalk garbageCollect