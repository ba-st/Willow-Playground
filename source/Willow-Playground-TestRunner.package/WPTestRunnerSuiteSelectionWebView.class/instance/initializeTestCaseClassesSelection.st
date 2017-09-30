initialization
initializeTestCaseClassesSelection

	testCaseClassesListBox := self componentSupplier multipleSelectionListBoxDisplayingAtOnce: 25 applying: [  ].
	testCaseClassesListBox onTrigger
		serializeWithHiddenInputs;
		evaluate: [ self session applicationContext setSelectedTestCaseClassesTo: testCaseClassesListBox chosenElements ]