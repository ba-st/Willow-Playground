initialization
symbolicBytecodesFor: aMethod

	^ [ :canvas | 
	canvas
		break;
		preformatted: [ canvas
				code:
					(String
						streamContents: [ :stream | 
							aMethod symbolicBytecodes
								do: [ :bytecode | stream nextPutAll: bytecode greaseString ]
								separatedBy: [ stream cr ] ]) ] ]