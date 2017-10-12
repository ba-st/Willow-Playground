private-accessing
contactFieldSet

	^ self componentSupplier
		fieldSetContaining: [ :canvas | 
			canvas
				div: [ canvas
						strong: 'Gabriel Cotelli';
						span: ' ';
						anchor: 'g.cotelli@mercapsoftware.com' ].
			canvas
				div: [ canvas
						strong: 'Maximiliano Tabacman';
						span: ' ';
						anchor: 'm.tabacman@mercapsoftware.com' ] ]
		applying: [ :content |  ]
		withLegend: 'Contact us!'
		applying: [ :legend |  ]