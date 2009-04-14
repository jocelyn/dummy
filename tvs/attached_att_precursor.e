note
	description: "Summary description for {ATTACHED_ATT_PRECURSOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ATTACHED_ATT_PRECURSOR

inherit
	ATTACHED_ATT
		redefine
			make
		end

create
	make

feature

	make
		do
			Precursor
			print ("hello")
		end

feature -- Access

feature -- Measurement

feature -- Status report

feature -- Status setting

feature -- Cursor movement

feature -- Element change

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

invariant
	invariant_clause: True -- Your invariant here

end
