indexing
	description : "basic_project application root class"
	date        : "$Date: 2008-12-30 00:41:59 +0100 (Tue, 30 Dec 2008) $"
	revision    : "$Revision: 76432 $"

class
	APPLICATION

inherit
	ABSTRACT_APPLICATION
		redefine
			f
		end

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			a: detachable ANY
			s: STRING
			sp: SPECIAL [CHARACTER]
			spp: SPECIAL [SPECIAL [CHARACTER]]
			fn: FILE_NAME
		do
--			a := <<1,2,3,4>>
			create fn.make
			s := f (fn)
			create sp.make (100)
			sp.set_count (80)
			sp.set_count (10)

			create spp.make (3)
			spp.put (sp, 1)
			s := "ABC"
			s := f_s
			s.to_lower
			if attached {STRING} create {STRING_8}.make_from_string ("BARR") as l_string then
				l_string.to_lower
			end
		end

 	f (s: FILE_NAME): STRING
 		do
 			Result := Precursor (s)
 		end

	f_s: STRING
		do
			Result := "out"
		end

end
