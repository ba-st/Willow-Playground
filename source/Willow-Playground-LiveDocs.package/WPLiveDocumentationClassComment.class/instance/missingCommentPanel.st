rendering
missingCommentPanel

	^ self componentSupplier panelBuilder
		headingDisplaying: 'Comment';
		wrapping: '';
		buildApplying: [ :panel | panel addClass bootstrap panelDanger ]