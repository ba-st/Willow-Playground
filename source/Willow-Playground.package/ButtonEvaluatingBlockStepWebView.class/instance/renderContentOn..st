rendering
renderContentOn: aCanvas

	| button |

	button := self componentSupplier
		asynchronicButtonLabeled: 'Click... then check your image'
		applying: CompositeComponentCommand empty.
	button onTrigger evaluate: [ 'The button was clicked on the browser' inspect ].
	aCanvas render: button