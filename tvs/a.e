deferred class
	A

feature

	is_one: BOOLEAN
		deferred
		end

	is_two: BOOLEAN
		deferred
		end

	one: STRING
		require
			is_one: is_one
		deferred
		ensure
			Result /= Void
		end

	two: STRING
		require
			is_two: is_two
		deferred
		ensure
			Result /= Void
		end

end
