initialization
initializeCurrentStepView

	currentStepView := IdentifiedWebView
		forDivNamed: 'currentStep'
		containing: [ :canvas | self renderCurrentStepOn: canvas ]
		applying: [ :div | div addClass smalltalks2017 presentationArea ]