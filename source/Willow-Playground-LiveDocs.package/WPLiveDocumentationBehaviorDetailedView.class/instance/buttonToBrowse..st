private
buttonToBrowse: aBehavior

	| browseButton |

	browseButton := self componentSupplier asynchronicAnchorLabeled: 'Open Browser' applying: [ :button | button addClass bootstrap buttonPrimary + button addClass bootstrap pullRight ].
	browseButton onTrigger evaluate: [ aBehavior browse ].
	^ browseButton