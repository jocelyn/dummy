note
	description: "Summary description for {ABSTRACT_APPLICATION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ABSTRACT_APPLICATION

feature

	f (s: STRING): STRING
		do
			Result := f2 (s)
		end

	f2 (s: like f): like f
		do
			Result := s
		end

end
