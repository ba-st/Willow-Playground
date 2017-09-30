initialization
initialize

	super initialize.
	self resetTestResult.
	selectedTestCaseClasses := #().
	selectedPackageCategories := #().
	messageTallyOptional := Optional unused