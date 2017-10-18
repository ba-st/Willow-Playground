Querying
availableBehaviors

	^ (selectedPackageOptional withContentDo: [ :package | package definedClasses ] ifUnused: [ #() ]) sorted: [ :a :b | a name < b name ]