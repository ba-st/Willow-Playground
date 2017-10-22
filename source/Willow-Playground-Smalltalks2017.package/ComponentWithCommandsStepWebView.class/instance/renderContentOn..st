rendering
renderContentOn: aCanvas

	| input |

	input := TextFieldWebView
		singleLineTriggeringOnChangeApplying:
			[ :theField | theField beAutofocused + theField bePasswordInput + (theField setPlaceholderTo: 'Tell me your secrets') ].

	aCanvas render: input