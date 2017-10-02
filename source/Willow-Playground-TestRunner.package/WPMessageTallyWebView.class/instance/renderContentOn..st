rendering
renderContentOn: html

	self
		renderSummaryOn: html;
		renderTreeOn: html;
		renderLeavesOn: html;
		renderGarbageCollectionStatsOn: html