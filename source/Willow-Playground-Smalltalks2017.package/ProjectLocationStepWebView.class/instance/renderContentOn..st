rendering
renderContentOn: aCanvas

	aCanvas
		div: [ aCanvas
				render: 'Hosted at the ';
				strong: 'ba-st';
				render: ' group in ';
				strong: 'GitHub' ].

	aCanvas render: self projectsTableView.

	aCanvas render: self contactFieldSet