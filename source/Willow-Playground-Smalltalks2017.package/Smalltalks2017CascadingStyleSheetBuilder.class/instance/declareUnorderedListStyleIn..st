style declaration
declareUnorderedListStyleIn: aBuilder

	aBuilder
		declareRuleSetFor:
				[ :selector | (selector div class: Smalltalks2017CssStyles stepContent) > selector unorderedList ]
			with: [ :style | 
			style
				display: CssConstants block;
				fontSize: CssFontConstants larger;
				marginTop: 120 px ];
		declareRuleSetFor: [ :selector | 
			(selector div class: Smalltalks2017CssStyles stepContent)
				> selector unorderedList listItem ]
			with: [ :style | 
				style
					display: CssConstants inlineBlock;
					width: 25 vw ]