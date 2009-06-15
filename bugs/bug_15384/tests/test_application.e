note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_APPLICATION

inherit
	EQA_TEST_SET

feature -- Test routines

	test_out
			-- New test routine
		do
			assert ("out not empty", out.count > 0)
		end

end


