initialization
initialize

	super initialize.
	currentTestResult := TestAsserter classForTestResult new.
	selectedTestCaseClasses := #().
	selectedPackageCategories := #()