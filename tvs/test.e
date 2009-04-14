note
	description: "Summary description for {TEST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST

create
	make

feature
	make (a: like internal)
		do
			internal := a
		end

	internal: ANY

end
