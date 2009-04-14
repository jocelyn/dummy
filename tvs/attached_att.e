note
	description: "Summary description for {ATTACHED_ATT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ATTACHED_ATT

inherit
	DEFERRED_ATTACHED_ATT

create
	make

feature -- Access

	print_hello
		do
			print ("Hello")
		end

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
