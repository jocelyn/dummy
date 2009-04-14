note
	description: "Summary description for {BAR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BAR [G]

feature -- Access

	test_arg_1 (v: G)
		require
			v_attached: v /= Void
		local
			g: ?G
		do
			g := v.twin
		end

end
