style declaration
declareBrowseStepButtonStyleIn: aBuilder

	aBuilder
		declareRuleSetFor: [ :selector | selector class: Smalltalks2017CssStyles browseStep ]
		with: [ :style | 
			style
				zIndex: 1;
				position: CssConstants absolute;
				marginTop: (3.3 newMeasureWith: CssLengthUnits onePercentOfViewportHeight);
				right: (6.4 newMeasureWith: CssLengthUnits onePercentOfViewportWidth) ]