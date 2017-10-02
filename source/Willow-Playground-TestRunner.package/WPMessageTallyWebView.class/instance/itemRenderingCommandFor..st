rendering
itemRenderingCommandFor: node

	^ [ :canvas | 
	canvas
		render: (PhrasingContainerWebView wrapping: (self percentageFor: node) applying: [ :label | label addClass bootstrap label + label addClass bootstrap labelPrimary ]);
		space;
		render:
			(PhrasingContainerWebView
				wrapping: [ :span | 
					span
						render: (self timeFor: node);
						space;
						render: 'ms' ]
				applying: [ :label | label addClass bootstrap label + label addClass bootstrap labelDefault ]);
		space;
		render: node greaseString;
		render: (self unorderedListRendering: node receivers) ]