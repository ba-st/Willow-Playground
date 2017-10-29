rendering
renderContentOn: aCanvas

	aCanvas
		render:
			(HeadingWebView
				displaying: [ :html | 
					html
						render: 'Willow and it''s related projects are part of the web stack ecosystem hosted at '.
					html anchor
						url: 'https://github.com/ba-st';
						with: [ html
								render: self gitHubImageView;
								strong: '/ba-st' ] ]
				withLevel: 3).
	aCanvas render: self projectsTableView.

	aCanvas render: self contactFieldSet