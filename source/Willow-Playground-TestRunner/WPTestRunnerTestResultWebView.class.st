"
I will show the test result
"
Class {
	#name : #WPTestRunnerTestResultWebView,
	#superclass : #WAPainter,
	#category : 'Willow-Playground-TestRunner'
}

{ #category : #rendering }
WPTestRunnerTestResultWebView >> detailsLinkShowing: testResult [

	| showDetailsAnchor |

	showDetailsAnchor := self componentSupplier
		asynchronicLinkActingAsButtonLabeled: 'See the details here.'
		applying: [ :anchor | anchor addClass bootstrap alertLink ].
	showDetailsAnchor onTrigger open: (WPTestRunnerTestResultDetailsDialog for: testResult).
	^ showDetailsAnchor
]

{ #category : #rendering }
WPTestRunnerTestResultWebView >> renderContentOn: html [

	| notificationBuilder testResult |

	testResult := self session applicationContext currentTestResult.

	notificationBuilder := self componentSupplier notificationBuilder.
	notificationBuilder
		success;
		wrapping: [ :canvas | 
			canvas
				render: testResult;
				render: $.;
				space;
				render: (self detailsLinkShowing: testResult) ].

	testResult hasFailures
		ifTrue: [ notificationBuilder warning ].
	testResult hasErrors
		ifTrue: [ notificationBuilder danger ].

	html render: notificationBuilder build
]
