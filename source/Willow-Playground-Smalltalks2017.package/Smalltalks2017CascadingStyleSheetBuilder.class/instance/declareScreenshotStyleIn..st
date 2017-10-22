style declaration
declareScreenshotStyleIn: aBuilder

	aBuilder
		declareRuleSetFor: [ :selector | selector image class: Smalltalks2017CssStyles screenshot ]
			with: [ :style | 
			style
				width: 60 vw;
				position: CssConstants absolute ];
		declareRuleSetFor: [ :selector | (selector image class: Smalltalks2017CssStyles screenshot) childAt: 2 ]
			with: [ :style | 
			style
				marginTop: 6 vh;
				marginLeft: 25 vw ];
		declareRuleSetFor: [ :selector | (selector image class: Smalltalks2017CssStyles screenshot) childAt: 3 ]
			with: [ :style | 
			style
				marginTop: 25 vh;
				marginLeft: 12 vw ]