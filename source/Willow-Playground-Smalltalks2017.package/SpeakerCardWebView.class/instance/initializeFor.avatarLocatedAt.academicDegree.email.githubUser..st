initialization
initializeFor: aFullName avatarLocatedAt: avatarLocation academicDegree: academicDegree email: mailUser githubUser: githubUser

	panel := self componentSupplier panelBuilder
		wrapping: [ :html | 
			html
				render: (self headingShowing: aFullName and: academicDegree withAvatarLocatedAt: avatarLocation);
				render: (self contactInfoByEMail: mailUser andGithub: githubUser) ];
		buildApplying: [ :card | card addClass bootstrap panelDefault ]