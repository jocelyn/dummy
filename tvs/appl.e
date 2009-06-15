class
	APPLICATION

create
	make

feature {NONE} -- Initialization

	make
		local
			a_string: STRING
			t: like the_tuple
		do
			t := the_tuple
			a_string := t.s
			a_string.to_upper
		end
			
	the_tuple: TUPLE [b: BOOLEAN; s: STRING]
		do
			create Result
		end

end
