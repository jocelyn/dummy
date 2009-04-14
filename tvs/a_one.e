class
	A_ONE

inherit
	A

feature

	is_one: BOOLEAN = True

	is_two: BOOLEAN = False

	one: STRING
		do
			Result := "one"
		end

	two: STRING
		local
			s: ?STRING
		do
			check should_not_occur: s /= Void end
			Result := s
		end

end
