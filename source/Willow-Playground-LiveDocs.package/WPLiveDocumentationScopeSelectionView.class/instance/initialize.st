initialization
initialize

	super initialize.
	self initializeIdentifiedBehaviorSelection.
	packagesListBox := self componentSupplier singleSelectionListBoxDisplayingAtOnce: 5 applying: [ :listBox | listBox labelItemsWith: [ :package | package name ] ].
	packagesListBox onTrigger
		serializeWithHiddenInputs;
		evaluate: [ packagesListBox withCurrentSelectionDo: [ :selectedPackage | self session applicationContext setSelectedPackageTo: selectedPackage ] ];
		render: identifiedBehaviorSelection.
	classesListBox := self componentSupplier singleSelectionListBoxDisplayingAtOnce: 10 applying: [ :listBox | listBox labelItemsWith: [ :class | class name ] ].
	traitsListBox := self componentSupplier singleSelectionListBoxDisplayingAtOnce: 5 applying: [ :listBox | listBox labelItemsWith: [ :trait | trait name ] ]