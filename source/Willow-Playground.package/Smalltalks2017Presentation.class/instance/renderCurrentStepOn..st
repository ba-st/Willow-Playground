private - rendering
renderCurrentStepOn: aCanvas

	| view |

	view := stepViews at: currentStepIndex.
	aCanvas heading: view description.

	aCanvas div
		class: Smalltalks2017CssStyles stepContent;
		with: view.

	aCanvas
		fieldSet:
			'Agregar a cada Step View algo que muestre el codigo renderizado (o en automatico desde el sender)'.
	self renderStepButtonsOn: aCanvas