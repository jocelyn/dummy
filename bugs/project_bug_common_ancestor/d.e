note
	description: "Summary description for {D}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	D

feature

	foo: BAR is
		once
			create Result
		ensure
			Result_attached: Result /= Void
		end


end
