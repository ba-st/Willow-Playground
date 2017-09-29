Controlling
startUpApplicationContextFor: aTestRunner

	super startUpApplicationContextFor: aTestRunner.
	applicationContext := WPTestRunnerApplicationContext workingOn: aTestRunner