initialization
initialRequest: request

	super initialRequest: request.
	
	self initializeStepViews.
	currentStepIndex := 1.
	self initializeCurrentStepView