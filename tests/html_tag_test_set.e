note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
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
			create l_head
			l_html.set_head (l_head)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head></head></html>", l_html.html_out)
			create l_body
			l_html.set_body (l_body)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head></head><body></body></html>", l_html.html_out)

			create l_base
			l_head.set_base (l_base)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head><base></base></head><body></body></html>", l_html.html_out)
			create l_link
			l_head.set_link (l_link)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head><base></base><link></link></head><body></body></html>", l_html.html_out)
			create l_meta
			l_head.set_meta (l_meta)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head><base></base><link></link><meta></meta></head><body></body></html>", l_html.html_out)
			create l_script
			l_head.set_script (l_script)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head><base></base><link></link><meta></meta><script></script></head><body></body></html>", l_html.html_out)
			create l_style
			l_head.set_style (l_style)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head><base></base><link></link><meta></meta><script></script><style></style></head><body></body></html>", l_html.html_out)
			create l_title
			l_head.set_title (l_title)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head><title></title><base></base><link></link><meta></meta><script></script><style></style></head><body></body></html>", l_html.html_out)
		end

	general_html_tag_creation_tests
			-- `general_html_tag_creation_tests'.
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
		do
			create l_a
			create l_br
			create l_div
			create l_footer
			create l_form
			create l_h1
			create l_h2
			create l_h3

			l_h1.html_content_items.force (l_h2)
			l_h2.html_content_items.force (l_h3)
			assert_strings_equal ("h1_h2_h3", "<h1><h2><h3></h3></h2></h1>", l_h1.html_out)

			create l_h1.make_with_content (<<create {HTML_H2}.make_with_content (<<create {HTML_H3}>>)>>)
			assert_strings_equal ("h1_h2_h3", "<h1><h2><h3></h3></h2></h1>", l_h1.html_out)

			create l_page.make_with_content (<<l_a, l_br, l_div, l_footer, l_form, l_h1>>)
			l_page.set_head (create {HTML_HEAD})
			assert_strings_equal ("page", "<!DOCTYPE html><html><head></head><body><a></a><br></br><div></div><footer></footer><form></form><h1><h2><h3></h3></h2></h1></body></html>", l_page.html_out)
		end

	html_style_tests
			-- `html_style_tests'.
		local
			l_table: HTML_TABLE
		do
			create l_table
			l_table.style_rule.border.attr_value := "1px solid black"
			assert_strings_equal ("style_1", "{border:1px solid black;}", l_table.style_out)
			l_table.style_rule.border_collapse.attr_value := "collapse"
			assert_strings_equal ("style_2", "{border:1px solid black; border-collapse:collapse;}", l_table.style_out)
			l_table.style_rule.page_break_inside.attr_value := "avoid"
			assert_strings_equal ("style_2", "{border:1px solid black; border-collapse:collapse; page-break-inside:avoid;}", l_table.style_out)
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
			create l_text.make_with_text ("Another line of text.")
			l_div.html_content_items.force (l_text)
			l_text.set_buffering_on
			assert_strings_equal ("div", "<div>This is some text. Another line of text.</div>", l_div.html_out)
			l_a.set_attribute_value (agent l_a.href, "http://www.w3schools.com")
			l_a.set_text_content ("Visit W3Schools")
			l_div.html_content_items.force (l_a)
			l_div.html_content_items.force (create {HTML_TEXT}.make_with_text ("And this is the last line of text."))
			assert_strings_equal ("div", "<div>This is some text. Another line of text.<a href=%"http://www.w3schools.com%">Visit W3Schools</a>And this is the last line of text.</div>", l_div.html_out)
		end

end


