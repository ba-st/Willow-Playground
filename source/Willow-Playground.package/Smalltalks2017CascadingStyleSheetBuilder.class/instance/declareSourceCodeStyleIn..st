style declaration
declareSourceCodeStyleIn: aBuilder

	aBuilder
		declareRuleSetFor: [ :selector | selector preformatted ]
		with: [ :style | 
			style
				width: 50 vw;
				marginTop: 2 em;
				marginLeft: 2 em;
				fontSize: 1.1 em ]