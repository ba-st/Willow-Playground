initialization
renderContentOn: html

	html
		render:
			(self componentSupplier panelBuilder
				headingDisplaying: 'Hierarchy';
				wrapping: [ :canvas | 
					selectedClass withAllSuperclasses reverse
						doWithIndex: [ :class :index | 
							index - 1
								timesRepeat: [ canvas
										space;
										space ].
							canvas
								render: class name;
								break ] ];
				buildApplying: [ :panel | panel addClass bootstrap panelDefault ])