Querying
availableTraits

	^ selectedPackageOptional withContentDo: [ :package | package definedClasses select: [ :class | class isTrait ] ] ifUnused: [ #() ]