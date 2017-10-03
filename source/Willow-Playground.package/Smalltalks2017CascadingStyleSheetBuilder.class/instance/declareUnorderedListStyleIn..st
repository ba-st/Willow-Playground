style declaration
declareUnorderedListStyleIn: aBuilder

	aBuilder
		declareRuleSetFor:
				[ :selector | (selector div class: Smalltalks2017CssStyles stepContent) > selector unorderedList ]
			with: [ :style | 
			style
				display: CssConstants block;
				width: 40 vw ];
		declareRuleSetFor: [ :selector | 
			(selector div class: Smalltalks2017CssStyles stepContent)
				> selector unorderedList listItem ]
			with: [ :style | 
				style
					display: CssConstants inlineBlock;
					width: 15 vw ]