note
	description: "Summary description for {DEFERRED_ATTACHED_ATT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	DEFERRED_ATTACHED_ATT

feature

	make
		do
			set_string ("abc")
		end

	set_string (s: STRING)
		do
			string := s
		end

	string: STRING

end
