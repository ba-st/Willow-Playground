style declaration
declareStepButtonsStyleIn: aBuilder

	aBuilder
		declareRuleSetFor: [ :selector | selector div class: Smalltalks2017CssStyles stepButtonContainer ]
			with: [ :style | 
			style
				marginTop: 2 em;
				width: 80 vw;
				marginLeft: CssConstants auto;
				marginRight: CssConstants auto ];
		declareRuleSetFor: [ :selector | selector button class: Smalltalks2017CssStyles previousStep ]
			with: [ :style | style float: CssConstants left ];
		declareRuleSetFor: [ :selector | selector button class: Smalltalks2017CssStyles nextStep ]
			with: [ :style | style float: CssConstants right ]