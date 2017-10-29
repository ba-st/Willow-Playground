initialization
initializeDelayed
	delayed := DelayedViewRenderer
		showing: SpinKitCubeGrid new
		whileEvaluating: [ self makeHeavyCalculations ]
		thenRendering: [ :canvas | canvas 
							render: periodical;
							render: table ]