indexing
	description	: "System's root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

create
	make

feature -- Initialization

	 make is
			-- Run application.
		local
			t: TUPLE [INTEGER, STRING, CHARACTER]
		do
			t := [123, "abc", 'z']
			(create {TEST}.make).do_nothing
		end

	infix ">" (o: ANY): BOOLEAN
		do

		end

	foo
		do

		end

end -- class APPLICATION
