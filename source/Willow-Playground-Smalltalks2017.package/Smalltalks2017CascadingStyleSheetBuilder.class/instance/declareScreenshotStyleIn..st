style declaration
declareScreenshotStyleIn: aBuilder

	aBuilder
		declareRuleSetFor: [ :selector | selector image class: Smalltalks2017CssStyles screenshot ]
		with: [ :style | 
			style
				maxHeight: 70 vh;
				margin: CssConstants auto ]