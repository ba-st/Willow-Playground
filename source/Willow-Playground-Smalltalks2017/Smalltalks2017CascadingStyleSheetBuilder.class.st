"
I generate the necessary CSS
"
Class {
	#name : #Smalltalks2017CascadingStyleSheetBuilder,
	#superclass : #ReflectiveCascadingStyleSheetBuilder,
	#category : 'Willow-Playground-Smalltalks2017'
}

{ #category : #'style declaration' }
Smalltalks2017CascadingStyleSheetBuilder >> declareBrowseStepButtonStyleIn: aBuilder [

	aBuilder
		declareRuleSetFor: [ :selector | selector class: Smalltalks2017CssStyles browseStep ]
			with: [ :style | 
			style
				zIndex: 1;
				position: CssConstants absolute;
				marginTop: 5 px;
				right: 9 vh;
				fontFamily: '"Helvetica Neue", Helvetica, Arial, sans-serif' ];
		declareRuleSetFor: [ :selector | (selector div class: 'carousel-inner') button class: Smalltalks2017CssStyles browseStep ] with: [ :style | style right: 2 vh ]
]

{ #category : #'style declaration' }
Smalltalks2017CascadingStyleSheetBuilder >> declareDisabledButtonStyleIn: aBuilder [

	aBuilder
		declareRuleSetFor: [ :selector | selector button disabled ]
		with: [ :style | 
			style
				color: CssSVGColors grey;
				background: CssSVGColors lightGrey;
				cursor: CssConstants notAllowed ]
]

{ #category : #'style declaration' }
Smalltalks2017CascadingStyleSheetBuilder >> declarePresentationAreaStyleIn: aBuilder [

	aBuilder
		declareRuleSetFor: [ :selector | selector class: Smalltalks2017CssStyles presentationArea ]
		with: [ :style | 
			style
				width: 90 vw;
				marginLeft: CssConstants auto;
				marginRight: CssConstants auto ]
]

{ #category : #'style declaration' }
Smalltalks2017CascadingStyleSheetBuilder >> declareScreenshotStyleIn: aBuilder [

	aBuilder
		declareRuleSetFor: [ :selector | selector image class: Smalltalks2017CssStyles screenshot ]
		with: [ :style | 
			style
				maxHeight: 70 vh;
				margin: CssConstants auto;
				paddingBottom: 40 px ]
]

{ #category : #'style declaration' }
Smalltalks2017CascadingStyleSheetBuilder >> declareSourceCodeStyleIn: aBuilder [

	aBuilder declareRuleSetFor: [ :selector | selector preformatted ] with: [ :style | style fontSize: 1.1 em ]
]

{ #category : #'style declaration' }
Smalltalks2017CascadingStyleSheetBuilder >> declareStepButtonsStyleIn: aBuilder [

	aBuilder
		declareRuleSetFor: [ :selector | selector div class: Smalltalks2017CssStyles stepButtonContainer ]
		with: [ :style | 
			style
				position: CssConstants fixed;
				width: 90 vw;
				bottom: 3 vh ]
]

{ #category : #'style declaration' }
Smalltalks2017CascadingStyleSheetBuilder >> declareStepContentStyleIn: aBuilder [

	aBuilder
		declareRuleSetFor: [ :selector | selector div class: Smalltalks2017CssStyles stepContent ]
		with: [ :style | 
			style
				maxHeight: 80 vh;
				fontSize: CssFontConstants larger ]
]

{ #category : #'style declaration' }
Smalltalks2017CascadingStyleSheetBuilder >> declareUnorderedListStyleIn: aBuilder [

	aBuilder
		declareRuleSetFor:
				[ :selector | (selector div class: Smalltalks2017CssStyles stepContent) * selector unorderedList ]
			with: [ :style | 
			style
				display: CssConstants block;
				fontSize: CssFontConstants larger ];
		declareRuleSetFor: [ :selector | 
			(selector div class: Smalltalks2017CssStyles stepContent)
				* selector unorderedList listItem ]
			with: [ :style | 
				style
					display: CssConstants inlineBlock;
					width: 25 vw ]
]
