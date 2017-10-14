as yet unclassified
selectedPackageIfNone: aBlock

	^ selectedPackageOptional withContentDo: [ :package | package ] ifUnused: aBlock