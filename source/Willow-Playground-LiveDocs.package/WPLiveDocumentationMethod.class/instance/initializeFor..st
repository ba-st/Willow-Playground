initialization
initializeFor: aMethod

	method := aMethod.
	methodPanel := self componentSupplier panelBuilder
		headingDisplaying: [ :canvas | 
			canvas strong: aMethod selector.
			canvas
				render:
					(PhrasingContainerWebView
						wrapping: aMethod protocol
						applying: [ :badge | badge addClass bootstrap badge + badge addClass bootstrap pullRight ]) ];
		wrapping: aMethod sourceCode;
		footer: [ :canvas | 
			canvas
				strong: 'LOC:';
				space;
				render: aMethod linesOfCode ];
		buildApplying: [ :panel | panel addClass bootstrap panelDefault ]