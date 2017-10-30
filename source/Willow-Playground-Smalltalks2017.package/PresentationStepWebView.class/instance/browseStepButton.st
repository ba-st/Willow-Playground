private-accessing
browseStepButton

	| browseButton |

	browseButton := self componentSupplier
		asynchronicButtonLabeled: 'Browse'
		applying: [ :theButton | theButton addClass bootstrap buttonDefault + theButton addClass smalltalks2017 browseStep ].
	browseButton onTrigger evaluate: [ self browse ].
	^ browseButton