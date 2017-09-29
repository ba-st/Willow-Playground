private
runTestSuites: testSuites

	CurrentExecutionEnvironment runTestsBy: [ testSuites do: [ :suite | suite run: currentTestResult ] ]