initialization
initializePackagesDropdown

	packagesDropdown := self componentSupplier dropdownListApplying: [ :dropdown | (dropdown labelItemsWith: [ :package | package name ]) + BootstrapSelectLiveSearchCommand default ].
	packagesDropdown onTrigger
		serializeIt;
		evaluate: [ packagesDropdown withCurrentSelectionDo: [ :selectedPackage | self session applicationContext setSelectedPackageTo: selectedPackage ] ];
		render: identifiedBehaviorSelection