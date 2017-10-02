rendering
renderSummaryOn: html

	self
		renderFullWithRowOn: html
		with: [ html
				render: (self headingRendering: 'Summary');
				render: (PhrasingContainerWebView wrapping: tally tally applying: [ :span | span addClass bootstrap label + span addClass bootstrap labelPrimary ]);
				space;
				render: 'tallies';
				space;
				render: (PhrasingContainerWebView wrapping: tally time applying: [ :span | span addClass bootstrap label + span addClass bootstrap labelDefault ]);
				space;
				render: 'mseconds' ]