private
initializeContainerView

	| behaviorDetails scopeSelection |

	behaviorDetails := IdentifiedWebView forDivNamed: 'behavior-details' containing: WPLiveDocumentationBehaviorDetailedView new.
	scopeSelection := WPLiveDocumentationScopeSelectionView new.
	scopeSelection onBehaviorSelectedTrigger
		executeOnClient: [ :script :canvas | script << (canvas jQuery id: behaviorDetails identifier) html: SpinKitTripleBounce new ];
		render: behaviorDetails.

	contentView := GenericContainerWebView
		wrapping:
			(self componentSupplier gridBuilder
				columnsWidths: #(3 9);
				addContent: scopeSelection;
				addContent: behaviorDetails;
				build)
		applying: [ :div | div addClass bootstrap container ]