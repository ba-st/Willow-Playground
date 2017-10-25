private-rendering
renderPanelWrapping: aRenderable on: aCanvas

	| panel |

	panel := self componentSupplier panelBuilder
		headingDisplaying: self description;
		wrapping: aRenderable;
		buildApplying: [ :thePanel | thePanel addClass bootstrap panelDefault ].

	aCanvas render: panel