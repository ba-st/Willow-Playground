updating
updateRoot: aRoot

	" Libraries added here are not considered until the server is restarted.
	  Including a library with a favicon.ico will automatically use it.	"

	super updateRoot: aRoot.
	Smalltalks2017FileMetadataLibrary default updateRoot: aRoot