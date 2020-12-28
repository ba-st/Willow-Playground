Class {
	#name : #WPB4TestRunnerTestResultWebView,
	#superclass : #WAPainter,
	#category : #'Willow-Playground-TestRunner-WebViews-Bootstrap-4'
}

{ #category : #rendering }
WPB4TestRunnerTestResultWebView >> detailsLinkShowing: testResult [

	| showDetailsAnchor |

	showDetailsAnchor := self componentSupplier
		asynchronicLinkActingAsButtonLabeled: 'See the details here.'
		applying: [ :anchor | anchor addClass bootstrap4 alertLink ].
	showDetailsAnchor on trigger open: ( WPB4TestRunnerTestResultDetailsDialog for: testResult ).
	^ showDetailsAnchor
]

{ #category : #rendering }
WPB4TestRunnerTestResultWebView >> renderContentOn: html [

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
