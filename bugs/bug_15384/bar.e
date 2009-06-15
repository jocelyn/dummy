class
	BAR

inherit
	FOO
		redefine
			foo
		end

feature

	foo
		require else
			pre: pre
			pre2: pre
		do
			print ("foo")
			print ("bar%N")
		end

	pre: BOOLEAN
		do
			print ("pre%N")
			Result := True
		end

end
