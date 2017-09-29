rendering
renderDetailsFor: aTestResult on: html

	html render: aTestResult.
	self
		renderFailuresFor: aTestResult on: html;
		renderErrorsFor: aTestResult on: html