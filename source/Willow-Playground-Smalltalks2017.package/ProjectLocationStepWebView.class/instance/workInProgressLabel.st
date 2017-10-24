private-accessing
workInProgressLabel

	^ PhrasingContainerWebView wrapping: 'WIP' applying: [ :span | span addClass bootstrap label + span addClass bootstrap labelWarning ]