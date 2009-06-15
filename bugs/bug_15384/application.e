class
	APPLICATION

inherit
	BAR
		redefine
			out
		end

create
	make

feature

	make
		do
			print_out
			foo
		end

	print_out
		require
			pre: pre
		do
			print (out)
		end

	out: STRING
		require else
			pre: pre
		do
			Result := "abc"
		end

end
