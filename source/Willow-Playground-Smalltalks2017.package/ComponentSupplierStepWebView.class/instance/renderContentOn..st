rendering
renderContentOn: aCanvas

	| button dropdown field |

	button := self componentSupplier
		asynchronicButtonLabeled: 'I am a button'
		applying: [ :theButton |  ].

	dropdown := self componentSupplier dropdownListApplying: [ :theDropdown |  ].
	dropdown allowAnyOf: self supplyingSelectors.

	field := self componentSupplier dateFieldApplying: [ :theField |  ].

	aCanvas
		render: button;
		render: dropdown;
		render: field