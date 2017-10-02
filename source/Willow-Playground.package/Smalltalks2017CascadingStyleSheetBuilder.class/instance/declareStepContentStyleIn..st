style declaration
declareStepContentStyleIn: aBuilder

	aBuilder
		declareRuleSetFor: [ :selector | selector div class: Smalltalks2017CssStyles stepContent ]
		with: [ :style | style height: 70 vh ]