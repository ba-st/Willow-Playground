rendering
unorderedListRendering: tallies

	^ (tallies isNil or: [ tallies isEmpty ])
		ifTrue: [ [  ] ]
		ifFalse: [ self componentSupplier unorderedListApplying: [ :list | list labelItemsWith: [ :node | self itemRenderingCommandFor: node ] ] listing: tallies applyingToEach: [  ] ]