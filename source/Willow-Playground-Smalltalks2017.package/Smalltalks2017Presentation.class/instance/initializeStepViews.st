initialization
initializeStepViews

	stepViews := OrderedCollection new
		add: IntroductionStepWebView new;
		add: NonInteractiveButtonStepWebView new;
		add: ButtonExecutingOnClientStepWebView new;
		add: ButtonEvaluatingBlockStepWebView new;
		add: ButtonRenderingComponentStepWebView new;
		add: InputInFormStepWebView new;
		add: FormTriggeringStepWebView new;
		add: ComponentSummaryStepWebView new;
		add: StyledButtonStepWebView new;
		add: ComponentWithCommandsStepWebView new;
		add: CommandSummaryStepWebView new;
		add: AdvancedComponentsExampleStepWebView new;
		add: ComponentSupplierStepWebView new;
		add: PlaygroundApplicationsStepWebView new;
		add: ScreenshotsStepWebView new;
		add: ProjectLocationStepWebView new;
		yourself