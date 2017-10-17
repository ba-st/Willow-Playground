rendering
renderContentOn: html

	html
		render:
			(self selectedClassHasComment
				ifTrue: [ self commentPanel ]
				ifFalse: [ self missingCommentPanel ])