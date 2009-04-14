class
	APPLICATION_TEST

create
	make

feature {NONE} -- Initialization

	make
		do
			create string.make_empty
--			create attached_test.make (Current)
		end

	string: STRING

	attached_test: TEST
		attribute
--			create Result.make (Current)
		end

end
