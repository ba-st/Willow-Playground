"
I generate the necessary CSS
"
Class {
	#name : #Smalltalks2017CascadingStyleSheetBuilder,
	#superclass : #ReflectiveCascadingStyleSheetBuilder,
	#category : #'Willow-Playground-Smalltalks2017-Libraries'
}

{ #category : #'style declaration' }
Smalltalks2017CascadingStyleSheetBuilder >> declareBrowseStepButtonStyleIn: aBuilder [

	aBuilder
		declareRuleSetFor: [ :selector | selector class: Smalltalks2017CssStyles browseStep ]
			with: [ :style :constants | 
			style
				zIndex: 1;
				position: constants >> #absolute;
				marginTop: 5 px;
				right: 9 vh;
				fontFamily: '"Helvetica Neue", Helvetica, Arial, sans-serif' ];
		declareRuleSetFor: [ :selector | (selector div class: 'carousel-inner') button class: Smalltalks2017CssStyles browseStep ] with: [ :style | style right: 2 vh ]
]

{ #category : #'style declaration' }
Smalltalks2017CascadingStyleSheetBuilder >> declareDisabledButtonStyleIn: aBuilder [

	aBuilder
		declareRuleSetFor: [ :selector | selector button disabled ]
		with: [ :style :constants | 
			style
				color: constants >> #colors >> #grey;
				background: constants >> #colors >> #lightGrey;
				cursor: constants >> #notAllowed ]
]

{ #category : #'style declaration' }
Smalltalks2017CascadingStyleSheetBuilder >> declarePresentationAreaStyleIn: aBuilder [

	aBuilder
		declareRuleSetFor: [ :selector | selector class: Smalltalks2017CssStyles presentationArea ]
		with: [ :style :constants | 
			style
				width: 90 vw;
				marginLeft: constants >> #auto;
				marginRight: constants >> #auto ]
]

{ #category : #'style declaration' }
Smalltalks2017CascadingStyleSheetBuilder >> declareScreenshotStyleIn: aBuilder [

	aBuilder
		declareRuleSetFor: [ :selector | selector image class: Smalltalks2017CssStyles screenshot ]
		with: [ :style :constants | 
			style
				maxHeight: 70 vh;
				margin: constants >> #auto;
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
		with: [ :style :constants | 
			style
				position: constants >> #fixed;
				width: 90 vw;
				bottom: 3 vh ]
]

{ #category : #'style declaration' }
Smalltalks2017CascadingStyleSheetBuilder >> declareStepContentStyleIn: aBuilder [

	aBuilder
		declareRuleSetFor: [ :selector | selector div class: Smalltalks2017CssStyles stepContent ]
		with: [ :style :constants | 
			style
				maxHeight: 80 vh;
				fontSize: constants >> #larger ]
]

{ #category : #'style declaration' }
Smalltalks2017CascadingStyleSheetBuilder >> declareUnorderedListStyleIn: aBuilder [

	aBuilder
		declareRuleSetFor: [ :selector | (selector div class: Smalltalks2017CssStyles stepContent) * selector unorderedList ]
			with: [ :style :constants | 
			style
				display: constants >> #block;
				fontSize: constants >> #larger ];
		declareRuleSetFor: [ :selector | (selector div class: Smalltalks2017CssStyles stepContent) * selector unorderedList listItem ]
			with: [ :style :constants | 
			style
				display: constants >> #inlineBlock;
				width: 25 vw ]
]
