Actions
runTestsProfiled

	| messageTally |

	messageTally := MessageTally
		spyOn: [ self runTests ]
		reportOtherProcesses: false
		cutoff: 1
		openResultWindow: false
		closeAfter: false.

	messageTallyOptional := (messageTally tally strictlyPositive and: [ messageTally time strictlyPositive ])
		ifTrue: [ Optional containing: messageTally ]
		ifFalse: [ Optional unused ]