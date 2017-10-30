private-accessing
browseStepButtonEvaluating: aCallback

	| browseButton |

	browseButton := self componentSupplier
		asynchronicButtonLabeled: 'Browse'
		applying: [ :theButton | theButton addClass bootstrap buttonDefault + theButton addClass bootstrap buttonSmall + theButton addClass smalltalks2017 browseStep ].
	browseButton onTrigger evaluate: aCallback.
	^ browseButton