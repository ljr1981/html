note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	HTML_BEM_TEST_SET

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

	HTML
		undefine
			default_create
		end

	HTML_FACTORY
		undefine
			default_create
		end

feature -- Test routines

	bem_out_test
			-- New test routine
		do
			new_div.set_bem_name ("photofx", "bifold-efx", "")
			last_new_div.append_class_name ("s1")

				-- Pure in-line styling ...
			last_new_div.add_style ("-webkit-transform", "translate3d(59px,0,0) rotate3d(0,1,0,-45deg)", unquoted, CSSisInline, noExtCSS, noSelectors)
			assert_strings_equal ("inline_1", inline_1, last_new_div.css_inline_out)
			assert_strings_equal ("html_inline_1", html_inline_1, last_new_div.html_out)

				-- We still have pure in-line, but now we add some internal
				-- and we don't want the pure in-line showing up in the internal.
				-- Also, we retest to ensure that the pure in-line remains the same.
			last_new_div.add_style ("color", "black", Quoted, CSSnotInline, noExtCSS, noSelectors)
			assert_strings_equal ("html_internal_1", html_internal_1, last_new_div.css_internal_out)
			assert_strings_equal ("inline_1_retest", inline_1, last_new_div.css_inline_out)
			assert_strings_equal ("html_inline_1_retest", html_inline_1, last_new_div.html_out)

				-- Let's add more internal styling ...
			last_new_div.add_style ("width", "640px", Quoted, CSSnotInline, noExtCSS, noSelectors)
			last_new_div.add_style ("height", "480px", Quoted, CSSnotInline, noExtCSS, noSelectors)
			assert_strings_equal ("html_internal_1", html_internal_2, last_new_div.css_internal_out)

				-- We add a duplicate to ensure it does not show up ...
			last_new_div.add_style ("height", "480px", Quoted, CSSnotInline, noExtCSS, noSelectors)
			assert_strings_equal ("html_internal_1_dupe", html_internal_2, last_new_div.css_internal_out)

				-- Add height with an overriding selector ...
			last_new_div.add_style ("height", "500px", Quoted, CSSnotInline, noExtCSS, "view")
			assert_strings_equal ("html_internal_1_dupe", html_internal_3, last_new_div.css_internal_out)

		end

feature {NONE} -- Test Support

	inline_1: STRING = "[
-webkit-transform:translate3d(59px,0,0) rotate3d(0,1,0,-45deg);
]"

	html_inline_1: STRING = "[
<div class="photofx__bifold-efx s1"  style="-webkit-transform:translate3d(59px,0,0) rotate3d(0,1,0,-45deg);"></div>
]"

	html_internal_1: STRING = "[
.photofx__bifold-efx .s1 {color:"black";}
]"

	html_internal_2: STRING = "[
.photofx__bifold-efx .s1 {color:"black";width:"640px";height:"480px";}
]"

	html_internal_3: STRING = "[
.photofx__bifold-efx .s1 {color:"black";width:"640px";height:"480px";}.view {height:"500px";}
]"

end


