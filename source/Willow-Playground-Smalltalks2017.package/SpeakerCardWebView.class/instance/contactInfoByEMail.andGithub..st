private
contactInfoByEMail: mailUser andGithub: githubUser

	^ [ :html | 
	html
		small: [ html definitionList
				class: BootstrapCssStyles definitionListHorizontal;
				with: [ html
						definitionTerm: 'Work E-Mail';
						definitionData: ('<1s>@mercapsoftware.com' expandMacrosWith: mailUser);
						definitionTerm: 'Personal E-Mail';
						definitionData: ('<1s>@gmail.com' expandMacrosWith: mailUser);
						definitionTerm: 'GitHub Profile';
						definitionData: [ html anchor
								url: ('https://www.github.com/<1s>' expandMacrosWith: githubUser);
								with: githubUser ] ] ] ]