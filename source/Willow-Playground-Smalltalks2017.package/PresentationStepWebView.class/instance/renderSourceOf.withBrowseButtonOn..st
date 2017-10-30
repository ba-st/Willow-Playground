private-rendering
renderSourceOf: aSelector withBrowseButtonOn: aCanvas

	self
		renderSourceOf: aSelector
		andBrowseButton: (Optional containing: (self browseStepButtonEvaluating: [ (self class >> aSelector) browse ]))
		on: aCanvas