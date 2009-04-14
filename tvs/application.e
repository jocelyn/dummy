indexing
	description : "test_void_safe application root class"
	date        : "$Date: 2008-12-29 15:41:59 -0800 (Mon, 29 Dec 2008) $"
	revision    : "$Revision: 76432 $"

class
	APPLICATION

inherit
	APP
		redefine
			test_breakable
		end

create
	make,
	make_from_string

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			attached_att_precursor: ATTACHED_ATT_PRECURSOR
--			foo: FOO [STRING]
--			a_one: A_ONE
--			a_two: A_TWO
			s: detachable STRING

			arr: ARRAY [INTEGER]
		do
			create attached_att_precursor.make
			make_from_string ("abc")
			print (att_string_count)

			if test_breakable then
			end

			test_local
			test_ot

			arr := << 1,2,3>>

			if attached {INTEGER_REF} arr[1] as ir then
				print ("ir%N")
			end

			if attached {INTEGER} arr[1] as i then
				print ("i%N")
			end

			s := out.deep_twin
			s := test_string (s)

--			create foo.make
		end

	test_formatter
		local
			j: INTEGER
		do
			if attached j.out as l_j_out then
				io.put_integer (l_j_out.count)
				print (l_j_out + "%N")
			end
		end

	test_breakable: BOOLEAN
		require else
			is_true: attached current as c and then c.out.count > 0
		local
			a: detachable ANY
			j: INTEGER
		do
			Result := Precursor and out /= Void and then out.string.count.out.count > 0
			debug
				print ("redefined test_breakable ..%N")
			end
			a := agent (s: STRING)
					require
						s /= Void and then s.count > 0
					local
						i: INTEGER
					do
						i := 123
						s.append (i.out)
						i := s.count
					end
			from
				j := 1
			invariant
				loop_inv: j > 0
			until
				j > 3
			loop
				if attached j.out.as_string_32 as l_j_out then
					if attached l_j_out.as_upper as l_upper then
						print (l_upper.out + "%N")
					end
				end
				j := j + 1
			variant p_var: 123 - j
			end
			print ("end of redefined test_breakable .." + "%N")
		ensure then
			valid_result: attached "123abc" as el_out and then el_out.count > 2
			valid_result2: attached "abc" as el_out2 and then el_out2.count > 2
			is_not_false: not False
		end

	test_local
		local
			i: INTEGER
			s: STRING
		do
			i := 123
			s := "abc"
		end

	test_ot
		local
			l_i: INTEGER
			l_s: STRING
		do
			if attached {STRING} out as s1 then
				print (s1)
			end
			if attached out as s3 then
				print (s3)
			end
			if attached {STRING} out then
				print (out)
			end
		end

	test_2
		local
--			d: ?STRING
--			s: STRING
		do
--			s := d.as_lower
		end

	make_n (n: INTEGER)
		local
			l_att_string: detachable like att_string
		do
			if n = 0  then
				create l_att_string.make_empty
			else
				create l_att_string.make (n)
			end
			att_string := l_att_string
		end

	test_string (a_string: STRING): STRING
		do
			if a_string.count = 0 then
				Result := "Empty string"
			else
				Result := a_string
			end
		end

--	application_test
--		local
--			at: APPLICATION_TEST
--		do
--			create at.make
--		end

--	attached_text: STRING
--		require
--			text /= Void
--		do
--			check text /= Void end
--			Result := text
--		end

	detachable_text: detachable STRING

	test_detachable_text is
		local
			i: INTEGER
			c: INTEGER
			error: BOOLEAN
			l_text: like detachable_text
		do
			error := False
			create l_text.make_from_string ("test")
			detachable_text := l_text
			from
				i := 0
				c := l_text.count
			until
				i > c or else error
			loop
				if i < c then
					l_text := Void
				else
					inspect i
					when 1,2 then
						l_text.to_lower
					when 3,4 then
							-- Do nothing.
					else
						error := True
						l_text := Void
					end
				end
				i := i + 1
			end
		end

	test_detachable_s
		local
			i: INTEGER
			s: detachable STRING
		do
			create s.make_empty
			from i := 1 until i > 5 loop
				if i = 1 then
					s.append_character ('#')
				else
					s := Void
				end
				i := i + 1
			end
		end

	att_string_count: INTEGER
		do
			Result := att_string.count
		end

	att_string: STRING

invariant
	att_string /= Void

end
