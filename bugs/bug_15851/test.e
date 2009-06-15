class TEST
inherit
--	TEST1
	ANY

create
	make

feature

	make is
		local
			c: ARRAYED_LIST [INTEGER]
		do
			c.fill (Void)
			f
		end

	x, y: STRING
		attribute
		ensure then
			Result /= Void
		end

	f
		do
			
		end

end
