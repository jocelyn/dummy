note
	description:
		"URLs for POP resources"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	date: "$Date: 2008-12-29 21:27:11 +0100 (Mon, 29 Dec 2008) $"
	revision: "$Revision: 76420 $"

class POP3_URL

inherit
	NETWORK_RESOURCE_URL
		redefine
			location
		end

create
	make

feature -- Access

	Service: STRING = "pop"
			-- Name of service (Answer: "pop")

	apop_authentication: BOOLEAN
			-- Use APOP for authentication

feature -- Status report

	Default_port: INTEGER = 110
			-- Number of default port for service (Answer: 110)

	Is_proxy_supported: BOOLEAN = True
			-- Are proxy connections supported? (Answer: yes)

	Has_username: BOOLEAN = True;
			-- Can address contain a username?

feature -- Access

	location: STRING
			-- Full URL of resource
			-- rfc2384: pop://<user>;auth=<auth>@<host>:<port>
		local
			s: detachable STRING
		do
			create Result.make_from_string (service)
			Result.append ("://")

			if not username.is_empty then
				create s.make_from_string (username)
			end
			if apop_authentication then
				if s = Void then
					create s.make_empty
				end
				s.append_string (";AUTH=+APOP")
			end
			if s /= Void then
				Result.append_string (s)
				Result.append_character ('@')
			end
			Result.append (host)
			if port /= 0 and port /= default_port then
				Result.append_character (':')
				Result.append_integer (port)
			end
		end

note
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"

end
