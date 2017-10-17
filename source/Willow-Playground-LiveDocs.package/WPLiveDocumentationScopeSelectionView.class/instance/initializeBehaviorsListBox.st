initialization
initializeBehaviorsListBox

	behaviorsListBox := self componentSupplier singleSelectionListBoxDisplayingAtOnce: 30 applying: [ :listBox | listBox labelItemsWith: [ :class | class name ] ].
	behaviorsListBox onTrigger
		serializeIt;
		evaluate: [ behaviorsListBox withCurrentSelectionDo: [ :selectedClass | self session applicationContext setSelectedBehaviorTo: selectedClass ] ]