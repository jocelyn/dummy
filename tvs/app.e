note
	description: "Summary description for {APP}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	APP

feature -- Access

	make_n (n: INTEGER)
		deferred
		end

	make_from_string (s: STRING)
		do
			make_n (s.count)
--			fill_with (s)
		end

	test_breakable: BOOLEAN
		require
			valid_pre: 1 < 2
			valid_out: attached out as app_pre_out and then app_pre_out.count > 1
			valid_out_count: app_pre_out.count > 0
		do
			print ("test_breakable ...%N")
			Result := True
		ensure
			result_true: Result = True
			post2: attached out as eo and then eo.count > 0
			result_true_value: attached Result.out as l_result_out and then l_result_out ~ (True).out
		end


end
