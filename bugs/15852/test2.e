
class TEST2
feature
	try
		do
			print ({like Current}.value); io.new_line
		end

	value: INTEGER
--		is 29
		external "C inline"
		alias "29"
		end

end
