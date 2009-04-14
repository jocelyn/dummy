class
	A_TWO

inherit
	A

feature

	is_one: BOOLEAN = False

	is_two: BOOLEAN = True

	one: STRING
		local
			s: ?STRING
		do
			check should_not_occur: s /= Void end
			Result := s
		end

	two: STRING
		do
			Result := "two"
		end

end
