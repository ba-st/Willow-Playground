Actions
runTests

	self
		resetTestResult;
		runTestSuites: (selectedTestCaseClasses select: [ :class | class isAbstract not ] thenCollect: [ :class | class suite ])