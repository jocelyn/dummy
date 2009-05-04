note
	description: "Summary description for {POP3_LOCATION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	POP3_LOCATION

create
	make

feature {NONE} -- Initialization

	make (a_location: STRING)
		local
			p,q,r: INTEGER
			a,s: detachable STRING
		do
			p := a_location.index_of (':', 1)
			if p > 0 then
				s := a_location.substring (1, p - 1)
				if s.is_case_insensitive_equal ("pop") then
					s := a_location.substring (p, p + 2)
					if s.is_case_insensitive_equal ("://") then
						p := p + 3
						q := a_location.index_of ('@', p)
						if q > 0 then
							a := a_location.substring (p, q - 1)
							s := a_location.substring (q + 1, a_location.count)
							p := a.index_of (';', 1)
							if p > 0 then
								username := a.substring (1, p - 1)
								--| FIXME: handle the auth parameter
							else
								username := a
							end
						else
							s := a_location.substring (p, a_location.count)
						end
						p := s.index_of (':', 1)
						if p > 0 then
							host := s.substring (1, p - 1)
							s.remove_head (p)
							if s.is_integer then
								port := s.to_integer
							else
								error := True
							end
						else
							host := s
						end
					end
				end
			end
		end

feature -- Access

	host: detachable STRING

	port: INTEGER

	username: detachable STRING

	string: STRING
		require
			is_valid: is_valid (False)
		do
			Result := "pop://"
			if username /= Void then
				Result.append_string (username)
				Result.append_character ('@')
			end
			Result.append_string (host)
			if port > 0 then
				Result.append_character (':')
				Result.append_integer (port)
			end
		end

feature -- status report

	is_valid (a_username_required: BOOLEAN): BOOLEAN
			-- rfc2384: pop://<user>;auth=<auth>@<host>:<port>
		do
			Result := not error and host /= Void and (not a_username_required or else username /= Void)
		end

feature {NONE} -- Implementation

	error: BOOLEAN

end
