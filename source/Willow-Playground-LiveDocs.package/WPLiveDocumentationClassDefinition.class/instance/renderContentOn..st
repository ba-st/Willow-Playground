initialization
renderContentOn: html

	html
		render:
			(self componentSupplier panelBuilder
				headingDisplaying: 'Definition';
				wrapping: [ :canvas | 
					canvas definitionList
						class: BootstrapCssStyles definitionListHorizontal;
						with: [ canvas
								definitionTerm: 'Superclass';
								definitionData: (selectedClass superclass ifNotNil: [ :superclass | superclass name ]);
								definitionTerm: 'Layout';
								definitionData: selectedClass classLayout class name;
								definitionTerm: 'Traits used';
								definitionData: selectedClass traitComposition;
								definitionTerm: 'Instance Variables';
								definitionData: [ selectedClass instVarNames do: [ :name | canvas render: name ] separatedBy: [ canvas break ] ];
								definitionTerm: 'Class Variables';
								definitionData: [ selectedClass classVarNames do: [ :name | canvas render: name ] separatedBy: [ canvas break ] ];
								definitionTerm: 'Pool Dictionaries';
								definitionData: [ selectedClass sharedPools do: [ :pool | canvas render: pool name ] separatedBy: [ canvas break ] ];
								definitionTerm: 'Category';
								definitionData: selectedClass category ] ];
				buildApplying: [ :panel | panel addClass bootstrap panelDefault ])