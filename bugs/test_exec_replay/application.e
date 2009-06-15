indexing
	description : "test_exec_replay application root class"
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
		do
			--| Add your code here
			test (123, "abc")
		end

	test (i: INTEGER; s: STRING)
		local
			l_i16: INTEGER_16
			l_char: CHARACTER
			l_bool: BOOLEAN
			l_s: STRING
		do
			l_i16 := i.as_integer_16
			l_char := s.item (1)
			l_bool := not s.is_empty
			l_s := s.twin
		end

end
