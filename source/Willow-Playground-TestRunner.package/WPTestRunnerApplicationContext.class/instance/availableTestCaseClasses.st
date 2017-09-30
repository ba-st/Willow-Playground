Querying
availableTestCaseClasses

	| testCaseClasses |

	testCaseClasses := Set new.
	TestCase
		withAllSubclassesDo: [ :class | 
			(selectedPackageCategories includes: class category)
				ifTrue: [ testCaseClasses add: class ] ].
	^ testCaseClasses sorted: [ :a :b | a name <= b name ]