initialization
initializePackageSelection

	packagesListBox := self componentSupplier multipleSelectionListBoxDisplayingAtOnce: 20 applying: [  ].
	packagesListBox onTrigger
		serializeWithHiddenInputs;
		evaluate: [ self session applicationContext setSelectedPackageCategoriesTo: packagesListBox chosenElements ];
		render: identifiedTestCaseClassesSelection