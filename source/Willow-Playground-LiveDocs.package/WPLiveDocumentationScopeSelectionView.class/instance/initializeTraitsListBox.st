initialization
initializeTraitsListBox

	traitsListBox := self componentSupplier singleSelectionListBoxDisplayingAtOnce: 5 applying: [ :listBox | listBox labelItemsWith: [ :trait | trait name ] ].
	traitsListBox onTrigger
		serializeIt;
		evaluate: [ traitsListBox withCurrentSelectionDo: [ :selectedTrait | self session applicationContext setSelectedBehaviorTo: selectedTrait ] ]