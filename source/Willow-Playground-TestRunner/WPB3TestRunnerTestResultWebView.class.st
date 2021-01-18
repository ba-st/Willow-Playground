"
I will show the test result
"
Class {
	#name : #WPB3TestRunnerTestResultWebView,
	#superclass : #WAPainter,
	#category : #'Willow-Playground-TestRunner-WebViews-Bootstrap-3'
}

{ #category : #rendering }
WPB3TestRunnerTestResultWebView >> detailsLinkShowing: testResult [

	| showDetailsAnchor |

	showDetailsAnchor := self componentSupplier
		asynchronicLinkActingAsButtonLabeled: 'See the details here.'
		applying: [ :anchor | anchor addClass bootstrap3 alertLink ].
	showDetailsAnchor on trigger open: ( WPB3TestRunnerTestResultDetailsDialog for: testResult ).
	^ showDetailsAnchor
]

{ #category : #rendering }
WPB3TestRunnerTestResultWebView >> renderContentOn: html [

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
