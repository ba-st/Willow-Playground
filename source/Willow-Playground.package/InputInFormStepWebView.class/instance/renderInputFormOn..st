private-rendering
renderInputFormOn: aCanvas

	| input |

	input := TextFieldWebView
		singleLineTriggeringOnChangeApplying: [ :theInput |  ].

	aCanvas form
		doNotSubmit;
		with: input