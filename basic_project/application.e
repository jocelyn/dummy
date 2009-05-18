indexing
	description : "basic_project application root class"
	date        : "$Date: 2008-12-30 00:41:59 +0100 (Tue, 30 Dec 2008) $"
	revision    : "$Revision: 76432 $"

class
	APPLICATION

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			if attached {STRING} create {STRING_8}.make_from_string ("BARR") as l_string then
				l_string.to_lower
			end
		end

end
