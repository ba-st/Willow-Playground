rendering
renderBoundedContainerWrapping: aRenderable on: html

	html
		render:
			(GenericContainerWebView
				wrapping: aRenderable
				applying: [ :div :constants | 
					div addClass bootstrap small
						+
							(div
								setStyleTo: [ :style | 
									style
										maxHeight: 250 px;
										overflowY: constants css scroll ]) ])