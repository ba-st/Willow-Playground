rendering
renderContentOn: html

	selectedClass hasComment
		ifTrue: [ html blockquote: [ selectedClass comment lines do: [ :line | html render: line ] separatedBy: [ html break ] ] ]