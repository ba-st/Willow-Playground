initialization
initializeForApplication: aTestRunnerWebApp

	application := aTestRunnerWebApp.
	selectedPackages := #().
	selectedClasses := #().
	self resetTestResult.