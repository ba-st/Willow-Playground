private
toolbarRenderingOnAction: testResult

	| toolbar |

	toolbar := WPTestRunnerToolbar new.
	
	toolbar onRunSelectedTestsTrigger
		executeOnClient: [ :script :canvas | script << (canvas jQuery id: testResult identifier) html: SpinKitTripleBounce new ];
		evaluate: [ self session applicationContext runTests ];
		render: testResult.

	toolbar onRunProfiledTrigger
		executeOnClient: [ :script :canvas | script << (canvas jQuery id: testResult identifier) html: SpinKitRotatingPlane new ];
		determineBehaviorByEvaluating: [ :response | 
			self session applicationContext runTestsProfiled.
			response onReturn
				open: WPTestRunnerMessageTallyDialog new;
				render: testResult ].

	^ toolbar