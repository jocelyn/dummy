note
	description: "Summary description for {FOO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FOO [G]

inherit
	BAR [G]
		redefine
			test_arg_1
		end

create
	make

feature -- Access

	make
		do
		end

	test_arg_1 (v: G)
		require else
			v_attached: v /= Void
		local
			g: ?G
		do
--			g := v.twin
		end

end
