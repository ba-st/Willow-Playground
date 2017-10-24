private-accessing
stableLabel

	^ PhrasingContainerWebView wrapping: 'STABLE' applying: [ :span | span addClass bootstrap label + span addClass bootstrap labelSuccess ]