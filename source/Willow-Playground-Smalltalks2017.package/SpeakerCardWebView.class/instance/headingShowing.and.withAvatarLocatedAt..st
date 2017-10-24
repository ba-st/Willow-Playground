private
headingShowing: aFullName and: academicDegree withAvatarLocatedAt: avatarLocation

	^ HeadingWebView
		displaying: [ :html | 
			html
				render:
					(ImageWebView
						locatedAt: avatarLocation
						applying: [ :avatar | avatar addClass bootstrap pullRight + avatar addClass bootstrap imageCircle + (avatar setStyleTo: [ :style | style width: 48 px ]) ]);
				render: aFullName;
				break;
				small: ('<1s> at FCEN - UBA' expandMacrosWith: academicDegree);
				break;
				small: [ html
						render: 'R&D at';
						space.
					html anchor
						url: 'http://www.mercapsoftware.com';
						with: 'Mercap Software' ] ]
		withLevel: 4