note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_POP3

inherit
	EQA_TEST_SET

feature -- Test routines

	test_pop3_url
			-- New test routine
		indexing
			testing:  "test", "pop"
		do
			test_this_pop3_url ("pop://test@foo.bar:8021/a/b/c")
			test_this_pop3_url ("pop://test@foo.bar:8021")
			test_this_pop3_url ("test@foo.bar:8021")
			test_this_pop3_url ("pop://rg;AUTH=+APOP@mail.eudora.com:8110")
			test_this_pop3_url ("pop://test;AUTH=SCRAM-MD5@foo.bar")
		end

	test_this_pop3_url (s: STRING_8)
		local
			url1, url2: POP3_URL
		do
			create url1.make (s)
			create url2.make (url1.location)
			assert ("same_location", url1 ~ url2)
		end

end


