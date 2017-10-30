style declaration
declareStepButtonsStyleIn: aBuilder

	aBuilder
		declareRuleSetFor: [ :selector | selector div class: Smalltalks2017CssStyles stepButtonContainer ]
		with: [ :style | 
			style
				position: CssConstants fixed;
				width: 90 vw;
				bottom: 3 vh ]