rendering
renderContentOn: html

	html div
		class: BootstrapCssStyles buttonToolbar;
		with: [ html div
				class: BootstrapCssStyles buttonGroup;
				with: runSelectedTestsButton.
			html div
				class: BootstrapCssStyles buttonGroup;
				with: [ html
						render: runProfiledButton;
						render: runCoverageButton ].
			html render: exportResultButton ]