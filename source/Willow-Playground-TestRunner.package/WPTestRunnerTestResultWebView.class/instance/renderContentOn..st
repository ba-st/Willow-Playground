rendering
renderContentOn: html

	| notificationBuilder testResult |

	testResult := self session applicationContext currentTestResult.

	notificationBuilder := self componentSupplier notificationBuilder.
	notificationBuilder
		success;
		wrapping: testResult.

	testResult hasFailures
		ifTrue: [ notificationBuilder warning ].
	testResult hasErrors
		ifTrue: [ notificationBuilder danger ].

	html render: notificationBuilder build