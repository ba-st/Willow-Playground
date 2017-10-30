initialization
initializeDropdown
	dropdown := self componentSupplier
		dropdownListApplying: [ :theDropdown |  ].
	dropdown allowAnyOf: self supplyingSelectors