style declaration
declarePresentationAreaStyleIn: aBuilder

	aBuilder
		declareRuleSetFor: [ :selector | selector class: Smalltalks2017CssStyles presentationArea ]
		with: [ :style | 
			style
				width: 90 vw;
				marginLeft: CssConstants auto;
				marginRight: CssConstants auto ]