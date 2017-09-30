rendering
renderDetailsFor: aTestResult on: html

	self
		renderSummaryFor: aTestResult on: html;
		renderFailuresFor: aTestResult on: html;
		renderErrorsFor: aTestResult on: html