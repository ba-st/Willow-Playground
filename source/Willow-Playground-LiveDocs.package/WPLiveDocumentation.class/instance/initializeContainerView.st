private
initializeContainerView

	contentView := GenericContainerWebView
		wrapping:
			(self componentSupplier gridBuilder
				columnsWidths: #(3 9);
				addContent: WPLiveDocumentationScopeSelectionView new;
				addContent: 'Docs';
				build)
		applying: [ :div | div addClass bootstrap container ]