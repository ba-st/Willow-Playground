rendering
unorderedListRendering: tallies

	^ (tallies isNil or: [ tallies isEmpty ])
		ifTrue: [ [  ] ]
		ifFalse: [ self componentSupplier
				unorderedListApplying: [ :list | 
					(list labelItemsWith: [ :node | self itemRenderingCommandFor: node ])
						+
							(list
								setStyleTo: [ :style | 
									style
										marginBottom: 0;
										paddingTop: 3 px ]) ]
				listing: tallies
				applyingToEach: [ :listItem | 
					listItem
						setStyleTo: [ :style | 
							style
								borderTop: 0;
								borderBottom: 0;
								borderRight: 0;
								paddingBottom: 0 ] ] ]