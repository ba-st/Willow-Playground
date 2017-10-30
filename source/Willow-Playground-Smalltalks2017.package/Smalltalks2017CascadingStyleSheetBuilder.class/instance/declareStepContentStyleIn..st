style declaration
declareStepContentStyleIn: aBuilder

	aBuilder
		declareRuleSetFor: [ :selector | selector div class: Smalltalks2017CssStyles stepContent ]
		with: [ :style | 
			style
				maxHeight: 80 vh;
				fontSize: CssFontConstants larger ]