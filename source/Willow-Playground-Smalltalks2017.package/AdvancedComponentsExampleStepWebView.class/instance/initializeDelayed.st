initialization
initializeDelayed

	delayed := DelayedViewRenderer
		showing: SpinKitCubeGrid new
		whileEvaluating: [ (Delay forSeconds: 2) wait ]
		thenRendering: [ :canvas | 
			canvas
				render: periodical;
				render: table ]