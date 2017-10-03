private-accessing
supplyingSelectors

	^ (self componentSupplier class localMethods
		select: [ :method | method category = 'Supplying' ]
		thenCollect: #selector) sorted