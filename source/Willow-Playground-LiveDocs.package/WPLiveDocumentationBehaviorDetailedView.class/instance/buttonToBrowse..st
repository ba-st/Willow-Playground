private
buttonToBrowse: aBehavior

	| browseButton |

	browseButton := self componentSupplier
		asynchronicLinkActingAsButtonLabeled: 'Open Browser'
		applying: [ :button | button addClass bootstrap buttonPrimary + button addClass bootstrap pullRight ].
	browseButton onTrigger evaluate: [ aBehavior browse ].
	^ browseButton