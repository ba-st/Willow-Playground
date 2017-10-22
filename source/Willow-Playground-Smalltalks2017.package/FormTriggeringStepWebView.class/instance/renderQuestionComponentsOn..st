private-rendering
renderQuestionComponentsOn: aCanvas

	aCanvas
		render:
			(self componentSupplier gridBuilder
				columnsWidths: #(2 2 4 2 2);
				addContent: '';
				addContent: 'Enter a question';
				addContent: input;
				addContent: button;
				addContent: '';
				build)