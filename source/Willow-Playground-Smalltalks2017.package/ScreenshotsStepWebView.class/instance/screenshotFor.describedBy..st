private-accessing
screenshotFor: aSymbol describedBy: aCaption

	^ [ :html | 
	html render: (ImageWebView locatedAt: Smalltalks2017FileMetadataLibrary / aSymbol applying: [ :theImage | theImage addClass smalltalks2017 screenshot ]).
	html div
		class: 'carousel-caption';
		style:
			(CssDeclarationBlock new
				color: CssSVGColors black;
				paddingBottom: 0);
		with: aCaption ]