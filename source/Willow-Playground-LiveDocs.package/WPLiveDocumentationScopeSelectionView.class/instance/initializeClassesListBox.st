initialization
initializeClassesListBox

	classesListBox := self componentSupplier singleSelectionListBoxDisplayingAtOnce: 10 applying: [ :listBox | listBox labelItemsWith: [ :class | class name ] ].
	classesListBox onTrigger
		serializeIt;
		evaluate: [ classesListBox withCurrentSelectionDo: [ :selectedClass | self session applicationContext setSelectedBehaviorTo: selectedClass ] ]