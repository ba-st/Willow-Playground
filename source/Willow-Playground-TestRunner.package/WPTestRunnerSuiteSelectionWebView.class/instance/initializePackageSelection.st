initialization
initializePackageSelection

	packagesListBox := self componentSupplier multipleSelectionListBoxDisplayingAtOnce: 25 applying: [  ].
	packagesListBox onTrigger
		serializeWithHiddenInputs;
		evaluate: [ self session applicationContext setSelectedPackageCategoriesTo: packagesListBox currentSelection ];
		render: identifiedTestCaseClassesSelection