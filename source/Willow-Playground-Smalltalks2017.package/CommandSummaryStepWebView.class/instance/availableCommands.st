private-accessing
availableCommands

	^ WebComponentCommandBuilder localMethods
		sorted: [ :a :b | a selector <= b selector ]