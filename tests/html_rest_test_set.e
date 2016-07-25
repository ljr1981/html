note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	HTML_REST_TEST_SET

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

feature -- Tests: Script

	REST_generation_test
			-- New test routine
		local
			l_rest: HTML_REST
			l_div: HTML_DIV
		do
			create l_div
			l_div.set_class_names ("thing")
			create l_rest
			l_rest.add_POST_JSON_data_script (l_div, "thing", "callback", "")
			assert_strings_equal ("blah", "<div class=%"thing%"></div>", l_div.html_out)
			assert_strings_equal ("blah2", POST_JSON_script_text, l_div.css_script_snippets [1].html_out)
		end

feature {NONE} -- Test: Support

	POST_JSON_script_text: STRING = "[
<script src="$(function() {
  $('thing').submit(function() {
    var jsonData = JSON.stringify($('thing').serializeObject())
    $.ajax({
		url: 'callback',
		type: 'POST',
		contentType: 'application/json',
		data: (jsonData)
	});
	
    return false;
  });
});"></script>
]"

end


