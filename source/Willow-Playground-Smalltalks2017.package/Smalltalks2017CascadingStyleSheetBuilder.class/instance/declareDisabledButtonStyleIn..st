style declaration
declareDisabledButtonStyleIn: aBuilder

	aBuilder
		declareRuleSetFor: [ :selector | selector button disabled ]
		with: [ :style | 
			style
				color: CssSVGColors grey;
				background: CssSVGColors lightGrey;
				cursor: CssConstants notAllowed ]