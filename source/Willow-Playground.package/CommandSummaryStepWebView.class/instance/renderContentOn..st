rendering
renderContentOn: aCanvas

	| anchors list |

	anchors := (WebComponentCommandBuilder localMethods sorted: [ :a :b | a selector <= b selector ])
		collect: [ :method | 
			| anchor |

			anchor := AsynchronicAnchorWebView labeled: method selector.
			anchor onTrigger evaluate: [ method browse ].
			anchor ].

	list := UnorderedListWebView
		applying: [ :theList |  ]
		listing: anchors
		applyingToEach: [ :theItem |  ].

	aCanvas render: list