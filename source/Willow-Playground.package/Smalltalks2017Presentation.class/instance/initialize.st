initialization
initialize

	super initialize.
	stepViews := OrderedCollection new
		add: IntroductionStepWebView new;
		add: NonInteractiveButtonStepWebView new;
		add: ButtonExecutingOnClientStepWebView new;
		add: ButtonEvaluatingBlockStepWebView new;
		add: ButtonRenderingComponentStepWebView new;
		add: InputInFormStepWebView new;
		add: FormTriggeringStepWebView new;
		add: ComponentSummaryStepWebView new;
		yourself.

	currentStepIndex := 1.

	currentStepView := IdentifiedWebView
		forDivNamed: 'currentStep'
		containing: [ :canvas | self renderCurrentStepOn: canvas ]