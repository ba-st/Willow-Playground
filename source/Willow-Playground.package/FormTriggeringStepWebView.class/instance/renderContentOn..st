rendering
renderContentOn: aCanvas

	| input button |

	self renderSourceOf: #formButtonAffecting: on: aCanvas.
	input := self textField.
	button := self formButtonAffecting: input.
	self renderFormContaining: input submittedBy: button on: aCanvas