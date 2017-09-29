Actions
runTestsProfiled

	| messageTally |

	messageTally := MessageTally
		spyOn: [ self runTests ]
		reportOtherProcesses: false
		cutoff: 1
		openResultWindow: false
		closeAfter: false.

	messageTallyOptional := Optional containing: (String streamContents: [ :stream | messageTally fullPrintExactOn: stream ])