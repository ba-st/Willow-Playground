initialization
renderContentOn: html

	html
		render:
			(self componentSupplier panelBuilder
				headingDisplaying: 'Comment';
				wrapping: [ :canvas | selectedClass comment lines do: [ :line | canvas render: line ] separatedBy: [ canvas break ] ];
				buildApplying: [ :panel | panel addClass bootstrap panelDefault ])