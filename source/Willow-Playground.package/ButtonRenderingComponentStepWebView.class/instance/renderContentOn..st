rendering
renderContentOn: aCanvas

	| button companion |

	companion := IdentifiedWebView forSpanNamed: 'Companion' containing: [ :canvas | canvas render: Time now ].

	button := self componentSupplier
		asynchronicButtonLabeled: 'Click for a change'
		applying: CompositeComponentCommand empty.
	button onTrigger render: companion.

	aCanvas
		render: button;
		render: companion