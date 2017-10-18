Querying
availablePackages

	^ RPackageOrganizer default packages sorted: [ :a :b | a name < b name ]