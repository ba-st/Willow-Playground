private
tallyLeavesSorted

	| dict |

	dict := IdentityDictionary new: 100.
	rootTally leavesInto: dict fromSender: nil.
	^ dict asSortedCollection