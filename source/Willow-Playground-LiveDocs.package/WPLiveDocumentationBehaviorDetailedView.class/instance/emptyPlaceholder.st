private
emptyPlaceholder

	^ self componentSupplier notificationBuilder
		informational;
		wrapping: [ :canvas | 
			canvas
				render: (BootstrapIconWebView representing: Glyphicons exclamationSign);
				space;
				strong: 'Hey! Looks like you don''t selected anything yet.';
				break;
				break;
				render: 'Give it a try to the left panel. Select a package and later a behavior to view it''s details.';
				space;
				strong: (BootstrapIconWebView representing: Glyphicons thumbsUp) ];
		build