style declaration
declareSourceCodeStyleIn: aBuilder

	aBuilder declareRuleSetFor: [ :selector | selector preformatted ] with: [ :style | style fontSize: 1.1 em ]