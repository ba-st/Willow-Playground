style declaration
declareBrowseStepButtonStyleIn: aBuilder

	aBuilder
		declareRuleSetFor: [ :selector | selector class: Smalltalks2017CssStyles browseStep ]
		with: [ :style | 
			style
				zIndex: 1;
				position: CssConstants fixed;
				right: (6.5 newMeasureWith: CssLengthUnits onePercentOfViewportWidth);
				top: 110 px ]