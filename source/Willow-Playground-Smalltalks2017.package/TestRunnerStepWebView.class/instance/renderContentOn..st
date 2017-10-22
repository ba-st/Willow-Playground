rendering
renderContentOn: aCanvas

	| anchor |

	anchor := self componentSupplier
		asynchronicAnchorLabeled: 'Open the Test Runner!'
		applying: (OpenNewLocationCommand navigatingTo: 'test-runner-bootstrap3').
	aCanvas render: anchor