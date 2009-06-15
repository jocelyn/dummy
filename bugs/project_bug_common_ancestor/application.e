indexing
	description : "project_bug_common_ancestor application root class"
	date        : "$Date: 2008-12-29 15:41:59 -0800 (Mon, 29 Dec 2008) $"
	revision    : "$Revision: 76432 $"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			a: THE_A
		do
			--| Add your code here
			create a.make
		end

end
