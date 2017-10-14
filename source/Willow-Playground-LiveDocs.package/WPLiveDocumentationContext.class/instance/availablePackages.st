as yet unclassified
availablePackages

	^ RPackageOrganizer default packages select: [ :package | package name beginsWith: 'Kernel' ]