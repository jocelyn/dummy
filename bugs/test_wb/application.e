indexing
	description : "test_wb application root class"
	date        : "$Date: 2008-12-30 00:41:59 +0100 (Tue, 30 Dec 2008) $"
	revision    : "$Revision: 76432 $"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			i, i1, i2: INTEGER
			s,s1,s2: STRING
		do
			from
				i := 1
			invariant
				inv (i)
			variant
				var (i)
			until
				until_condition (i)
			loop
				print (i.out + "%N")
				i := i + 1
			end

			s := "abcdef"
			test_integer (i1, i2)
			i1 := 1
			test_integer (i1, i2)
			i2 := 1
			test_integer (i1, i2)
			i2 := 2
			test_integer (i1, i2)
			i1 := 2
			test_integer (i1, i2)


			test_string (s1, s2)
			s1 := "abc"
			test_string (s1, s2)
			s2 := "abc"
			test_string (s1, s2)
			s2 := s1
			test_string (s1, s2)
			s1 := "defg"
			test_string (s1, s2)
			s2 := Void
			test_string (s1, s2)
		end

	until_condition (i: INTEGER): BOOLEAN
		do
			Result := i > 3
			print ("until (" + i.out + ")%N")
		end

	var (i: INTEGER): INTEGER
		do
			Result := 1000 - i
			print ("var (" + i.out + ")%N")
		end

	inv (i: INTEGER): BOOLEAN
		do
			Result := i >= 0
			print ("inv (" + i.out + ")%N")
		end


	test_integer (i1,i2: INTEGER)
		do
			print ("i1=" + i1.out)
			print (" i2=" + i2.out)
			print ("%N")

			print ("%T(i1 = i2) => ")
			print (i1 = i2)
			print ("%N")

			print ("%T(i1 ~ i2) => ")
			print (i1 ~ i2)
			print ("%N")
		end

	test_string (s1,s2: STRING)
		do
			test (s1, s2)
		end

	test (s1,s2: ANY)
		do
			print ("s1=")
			print (s1)
			print (" s2=")
			print (s2)
			print ("%N")

			print ("%T(s1 = s2) => ")
			print (s1 = s2)
			print ("%N")

			print ("%T(s1 ~ s2) => ")
			print (s1 ~ s2)
			print ("%N")
		end

end
