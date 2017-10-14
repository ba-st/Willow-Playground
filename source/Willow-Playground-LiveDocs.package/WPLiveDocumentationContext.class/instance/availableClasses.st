Querying
availableClasses

	^ (selectedPackageOptional withContentDo: [ :package | package definedClasses reject: [ :class | class isTrait ] ] ifUnused: [ #() ]) sorted: [ :a :b | a name < b name ]