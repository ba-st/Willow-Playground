style declaration
declareStepButtonsStyleIn: aBuilder

	aBuilder
		declareRuleSetFor: [ :selector | selector div class: Smalltalks2017CssStyles stepButtonContainer ]
			with: [ :style | 
			style
				position: CssConstants absolute;
				width: 80 vw;
				left: 10 vw;
				bottom: 3 vh ];
		declareRuleSetFor: [ :selector | 
			(selector button class: Smalltalks2017CssStyles previousStep)
				, (selector button class: Smalltalks2017CssStyles nextStep) ]
			with: [ :style | style width: 220 px ];
		declareRuleSetFor: [ :selector | selector button class: Smalltalks2017CssStyles previousStep ]
			with: [ :style | style float: CssConstants left ];
		declareRuleSetFor: [ :selector | selector button class: Smalltalks2017CssStyles nextStep ]
			with: [ :style | style float: CssConstants right ]