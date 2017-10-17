private - rendering
renderCurrentStepOn: aCanvas

	| view |

	view := stepViews at: currentStepIndex.
	aCanvas heading: view description.

	aCanvas div
		class: Smalltalks2017CssStyles stepContent;
		with: view.

	self renderStepButtonsOn: aCanvas