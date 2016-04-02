note
	description: "Tests of {HTML}."
	testing: "type/manual"

class
	HTML_TEST_SET

inherit
	EQA_TEST_SET
		rename
			assert as assert_old
		end

	EQA_COMMONLY_USED_ASSERTIONS
		undefine
			default_create
		end

	TEST_SET_BRIDGE
		undefine
			default_create
		end

	HTML_ANY
		undefine
			default_create
		end

feature -- Test routines

	HTML_tests
			-- `HTML_tests'
		do
			do_nothing -- yet ...
		end

end
