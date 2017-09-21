rendering
renderContentOn: aCanvas

	| button |

	button := self componentSupplier
		asynchronicButtonLabeled: 'Now it''s time to click'
		applying: CompositeComponentCommand empty.
	button onTrigger
		executeOnClient:
			[ :script :scriptCanvas | script << scriptCanvas javascript alert: 'You just clicked a button' ].
	aCanvas render: button