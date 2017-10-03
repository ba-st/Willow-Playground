rendering
renderDetailsFor: aTestResult on: html

	html render: (self summaryFor: aTestResult).
	self
		renderFailuresFor: aTestResult on: html;
		renderErrorsFor: aTestResult on: html