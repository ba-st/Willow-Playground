style declaration
declareBrowseStepButtonStyleIn: aBuilder

	aBuilder
		declareRuleSetFor: [ :selector | selector class: Smalltalks2017CssStyles browseStep ]
		with: [ :style | 
			style
				zIndex: 1;
				position: CssConstants absolute;
				marginTop: 5 px;
				right: 9 vh;
				fontFamily: '"Helvetica Neue", Helvetica, Arial, sans-serif' ]