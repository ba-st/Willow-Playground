Querying
availablePackageCategories

	| categories |

	categories := Set new.
	TestCase withAllSubclassesDo: [ :class | class category ifNotNil: [ :category | categories add: category ] ].
	^ categories sorted