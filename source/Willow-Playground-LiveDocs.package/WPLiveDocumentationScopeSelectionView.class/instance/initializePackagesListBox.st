initialization
initializePackagesListBox

	packagesListBox := self componentSupplier singleSelectionListBoxDisplayingAtOnce: 5 applying: [ :listBox | listBox labelItemsWith: [ :package | package name ] ].
	packagesListBox onTrigger
		serializeIt;
		evaluate: [ packagesListBox withCurrentSelectionDo: [ :selectedPackage | self session applicationContext setSelectedPackageTo: selectedPackage ] ];
		render: identifiedBehaviorSelection