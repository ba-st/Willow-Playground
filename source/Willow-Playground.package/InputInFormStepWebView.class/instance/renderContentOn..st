rendering
renderContentOn: aCanvas

	| input |

	input := TextFieldWebView
		singleLineTriggeringOnChangeApplying: CompositeComponentCommand empty.

	aCanvas form
		doNotSubmit;
		with: input