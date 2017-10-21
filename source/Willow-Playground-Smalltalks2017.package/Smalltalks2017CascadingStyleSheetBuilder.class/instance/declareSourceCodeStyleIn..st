style declaration
declareSourceCodeStyleIn: aBuilder

	aBuilder
		declareRuleSetFor: [ :selector | selector preformatted ]
		with: [ :style | 
			style
				marginTop: 2 em;
				fontSize: 1.1 em ]