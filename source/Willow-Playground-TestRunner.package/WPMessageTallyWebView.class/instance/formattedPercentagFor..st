rendering
formattedPercentagFor: node

	^ (GRNumberPrinter new
		precision: 2;
		yourself) , '%' print: (self percentageFor: node) value