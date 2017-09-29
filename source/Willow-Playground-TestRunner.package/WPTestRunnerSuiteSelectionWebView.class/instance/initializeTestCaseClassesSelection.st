initialization
initializeTestCaseClassesSelection

	testCaseClassesListBox := self componentSupplier multipleSelectionListBoxDisplayingAtOnce: 20 applying: [  ].
	testCaseClassesListBox onTrigger
		serializeWithHiddenInputs;
		evaluate: [ self session applicationContext setSelectedTestCaseClassesTo: testCaseClassesListBox chosenElements ]