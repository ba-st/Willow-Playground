private-utility
registerAsApplicationUsing: deploymentModeClass

	| application |

	application := super registerAsApplicationUsing: deploymentModeClass.
	application configuration at: #maximumRelativeAge put: 3600.
	application cache: application createCache.
	^ application