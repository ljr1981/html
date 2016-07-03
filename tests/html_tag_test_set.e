note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	testing: "type/manual"

class
	HTML_TAG_TEST_SET

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

feature -- Test routines

	html_tag_basic_tests
			-- `html_tag_basic_tests'.
		local
			l_html: HTML_PAGE
			l_head: HTML_HEAD
			l_body: HTML_BODY

			l_base: HTML_BASE
			l_link: HTML_LINK
			l_meta: HTML_META
			l_script: HTML_SCRIPT
			l_style: HTML_STYLE
			l_title: HTML_TITLE
		do
			create l_html
			assert_strings_equal ("html_page", "<!DOCTYPE html><html></html>", l_html.html_out)
			assert_strings_equal ("html_page_prettified", pretty_html, l_html.pretty_out)

			create l_head
			l_html.set_head (l_head)
			assert_strings_equal ("html_head", "<!DOCTYPE html><html><head></head></html>", l_html.html_out)
			assert_strings_equal ("html_head_prettified", pretty_head, l_html.pretty_out)

			create l_body
			l_html.set_body (l_body)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head></head><body></body></html>", l_html.html_out)

			create l_base
			l_head.set_base_tag (l_base)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head><base></base></head><body></body></html>", l_html.html_out)
			create l_link
			l_head.set_link_tag (l_link)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head><base></base><link></link></head><body></body></html>", l_html.html_out)
			create l_meta
			l_head.set_meta_tag (l_meta)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head><base></base><link></link><meta></meta></head><body></body></html>", l_html.html_out)
			create l_script
			l_head.set_script_tag (l_script)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head><base></base><link></link><meta></meta><script></script></head><body></body></html>", l_html.html_out)
			create l_style
			l_head.set_style_tag (l_style)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head><base></base><link></link><meta></meta><script></script><style></style></head><body></body></html>", l_html.html_out)
			create l_title
			l_head.set_title_tag (l_title)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head><title></title><base></base><link></link><meta></meta><script></script><style></style></head><body></body></html>", l_html.html_out)
		end

feature -- Testing: Support

	pretty_html: STRING = "<!DOCTYPE html><html>%N%T%N%T%N%T</html>%N%T"
	pretty_head: STRING = "<!DOCTYPE html><html>%N%T<head>%N%T%N%T</head>%N%T%N%T%N%T</html>%N%T"

feature -- Testing: Creation Tests

	general_html_tag_creation_tests
			-- `general_html_tag_creation_tests'.
		local
			l_a: HTML_A
			l_br: HTML_BR
			l_div: HTML_DIV
			l_footer: HTML_FOOTER
			l_h1: HTML_H1
			l_h2: HTML_H2
			l_h3: HTML_H3
			l_page: HTML_PAGE
				-- Forms
			l_form: HTML_FORM
			l_button: HTML_BUTTON
			l_check_group: HTML_CHECKBOX_GROUP
			l_fieldset: HTML_FIELDSET
			l_input: HTML_INPUT
			l_label: HTML_LABEL
			l_legend: HTML_LEGEND
			l_optgroup: HTML_OPTGROUP
			l_option: HTML_OPTION
			l_radio: HTML_RADIO_INPUT_FIELD
			l_radio_group: HTML_RADIO_INPUT_FIELD_GROUP
			l_select: HTML_SELECT
			l_textarea: HTML_TEXTAREA
			l_text: HTML_TEXT_INPUT_FIELD
			l_text_group: HTML_TEXT_INPUT_FIELD_GROUP
		do
			create l_a
			create l_br
			create l_div
			create l_form
			create l_h1
			create l_h2
			create l_h3
			create l_footer

				-- Form creations
			create l_form
			create l_button
			create l_check_group.make_with_data ("check_label", "check_name", <<"value_1">>, False)
			create l_fieldset
			create l_input
			create l_label
			create l_legend
			create l_optgroup
			create l_option
			create l_radio.make_with_data ("radio_label", "radio_name", "radio_value", False)
			create l_radio_group.make_with_data ("group_label", <<["radio_label", "radio_name", "radio_value", False]>>)
			create l_select
			create l_textarea
			create l_text.make_with_data ("text_label", "text_name", "10", "10", False)
			create l_text_group.make_with_data (<<["text_label", "text_name", "10", "10", False]>>)

			l_h1.html_content_items.force (l_h2)
			l_h2.html_content_items.force (l_h3)
			assert_strings_equal ("h1_h2_h3", "<h1><h2><h3></h3></h2></h1>", l_h1.html_out)

			create l_h1.make_with_content (<<create {HTML_H2}.make_with_content (<<create {HTML_H3}>>)>>)
			assert_strings_equal ("h1_h2_h3", "<h1><h2><h3></h3></h2></h1>", l_h1.html_out)

			create l_page.make_with_content (<<l_a, l_br, l_div, l_footer, l_form, l_h1>>)
			l_page.set_head (create {HTML_HEAD})
			assert_strings_equal ("page", "<!DOCTYPE html><html><head></head><body><a></a><br/><div></div><footer></footer><form></form><h1><h2><h3></h3></h2></h1></body></html>", l_page.html_out)
		end

	html_style_tests
			-- `html_style_tests'.
		note
			warning: "[
				At this time, the style_rule's cannot be set using {CSS_RULE} as shown in
				the commented out code below. This is because the {CSS_RULE} no longer inherits
				from {FW_ATTRIBUTE_HELPER}, but has a collection {CSS_RULE} items, each with
				its own `out' feature. So, setting of the rules in HTML becomes much more
				difficult (at the moment). This needs to change!
				
				It might mean a rework of the {FW_ATTRIBUTE_HELPER} to properly handle the
				new forms of {CSS_DECLARATION} and perhaps even the notion of a collection
				of {BEM_BLOCK} items.
				]"
		local
			l_table: HTML_TABLE
		do
			create l_table
--			l_table.style_rule.border.attr_value := "1px solid black"
--			assert_strings_equal ("style_1", "{border:1px solid black;}", l_table.style_out)
--			l_table.style_rule.border_collapse.attr_value := "collapse"
--			assert_strings_equal ("style_2", "{border:1px solid black; border-collapse:collapse;}", l_table.style_out)
--			l_table.style_rule.page_break_inside.attr_value := "avoid"
--			assert_strings_equal ("style_2", "{border:1px solid black; border-collapse:collapse; page-break-inside:avoid;}", l_table.style_out)
		end

	external_css_style_sheet_tests
			-- `external_css_style_sheet_tests'
		local
			l_div: HTML_DIV
		do
			create l_div
			l_div.set_external_css_file_name ("stylesheet.css")
			assert_attached ("has_external_css", l_div.external_css)
			assert_integers_equal ("has_files", 1, l_div.external_css_files.count)
		end

	html_text_tests
			-- `html_text_tests'.
		local
			l_a: HTML_A
			l_br: HTML_BR
			l_div: HTML_DIV
			l_footer: HTML_FOOTER
			l_form: HTML_FORM
			l_h1: HTML_H1
			l_h2: HTML_H2
			l_h3: HTML_H3
			l_page: HTML_PAGE
			l_text: HTML_TEXT
		do
			create l_a
			create l_br
			create l_div
			create l_footer
			create l_form
			create l_h1
			create l_h2
			create l_h3
			create l_text

			l_text.set_text_content ("This is some text.")
			l_div.html_content_items.force (l_text)
			assert_strings_equal ("div", "<div>This is some text.</div>", l_div.html_out)
			create l_text.make_with_buffered_text ("Another line of text.")
			l_div.html_content_items.force (l_text)
			assert_strings_equal ("div", "<div>This is some text. Another line of text.</div>", l_div.html_out)
			l_a.set_attribute_value (agent l_a.href, "http://www.w3schools.com")
			l_a.set_text_content ("Visit W3Schools")
			l_div.html_content_items.force (l_a)
			l_div.html_content_items.force (create {HTML_TEXT}.make_with_text ("And this is the last line of text."))
			assert_strings_equal ("div", "<div>This is some text. Another line of text.<a href=%"http://www.w3schools.com%">Visit W3Schools</a>And this is the last line of text.</div>", l_div.html_out)
		end

feature -- Testing: {HTML_SCRIPT}

	html_script_test
			-- `html_script_test'.
		local
			l_script: HTML_SCRIPT
			l_body: HTML_BODY
		do
			create l_script
			l_script.set_attribute_value (agent l_script.src, "jquery-2.3.3.js")
			assert_strings_equal ("jquery_script", "<script src=%"jquery-2.3.3.js%"></script>", l_script.html_out)

			create l_script.make_with_src ("jquery-2.3.3.js")
			assert_strings_equal ("jquery_script", "<script src=%"jquery-2.3.3.js%"></script>", l_script.html_out)

			create l_body
			l_body.add_script (l_script)
			assert_strings_equal ("body_jquery_script", "<body><script src=%"jquery-2.3.3.js%"></script></body>", l_body.html_out)

			l_body.add_content (create {HTML_DIV}.make_with_raw_text ("some_text"))
			assert_strings_equal ("body_jquery_script", "<body><div>some_text</div><script src=%"jquery-2.3.3.js%"></script></body>", l_body.html_out)
		end

feature -- Testing: {HTML_HEADLINE_X}

	html_headline_x_test
			-- `html_headline_x_test'
		local
			l_tag: HTML_DIV
		do
			create l_tag
			assert_strings_equal ("hx", "<h1></h1>", l_tag.new_hx.html_out)
			l_tag.new_hx.set_h1
			l_tag.new_hx.set_h2
			l_tag.new_hx.set_h3
			l_tag.new_hx.set_h4
			l_tag.new_hx.set_h5
			l_tag.new_hx.set_h6
		end

end


