style declaration
declarePresentationAreaStyleIn: aBuilder

	aBuilder
		declareRuleSetFor: [ :selector | selector class: Smalltalks2017CssStyles presentationArea ]
		with: [ :style | 
			style
				width: 90 vw;
				height: 95 vh;
				marginLeft: CssConstants auto;
				marginRight: CssConstants auto ]