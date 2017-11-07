private-rendering
renderCarouselControlIn: carouselIdentifier slidingTo: aSlideTarget anchorStyledWith: anAnchorClass spanStyledWith: aSpanClass named: aName on: aCanvas

	aCanvas anchor
		classes:
			{anAnchorClass.
			'carousel-control'};
		url: ('#<1s>' expandMacrosWith: carouselIdentifier);
		attributeAt: 'role' put: 'button';
		attributeAt: 'data-slide' put: aSlideTarget;
		style:
			(CssDeclarationBlock new
				maxWidth: 50 px;
				background: CssConstants none);
		with: [ aCanvas span
				classes:
					{BootstrapCssStyles glyphicon.
					aSpanClass};
				attributeAt: 'aria-hidden' put: true.
			aCanvas span
				class: 'sr-only';
				with: aName ]