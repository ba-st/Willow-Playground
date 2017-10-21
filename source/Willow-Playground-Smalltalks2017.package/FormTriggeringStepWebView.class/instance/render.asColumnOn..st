private-rendering
render: aRenderable asColumnOn: aCanvas

	aCanvas div
		class: (BootstrapCssStyles columnMedium: 4);
		with: aRenderable