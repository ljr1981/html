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

	HTML_creation_tests
			-- `HTML_creation_tests'
		local
		 l_a_hyperlink: HTML_A
		 l_base: HTML_BASE
		 l_body: HTML_BODY
		 l_br: HTML_BR
		 l_div: HTML_DIV
		 l_footer: HTML_FOOTER
		 l_h1: HTML_H1
		 l_h2: HTML_H2
		 l_h3: HTML_H3
		 l_h4: HTML_H4
		 l_h5: HTML_H5
		 l_h6: HTML_H6
		 l_head: HTML_HEAD
		 l_form: HTML_FORM
		 l_img: HTML_IMG
		 l_input: HTML_INPUT
		 l_li: HTML_LI
		 l_link: HTML_LINK
		 l_meta: HTML_META
		 l_nav: HTML_NAV
		 l_ol: HTML_OL
		 l_p: HTML_P
		 l_page: HTML_PAGE
		 l_script: HTML_SCRIPT
		 l_style: HTML_STYLE
		 l_table: HTML_TABLE
		 l_td: HTML_TD
		 l_th: HTML_TH
		 l_title: HTML_TITLE
		 l_tr: HTML_TR
		 l_ul: HTML_UL
		do
			create l_a_hyperlink
			create l_a_hyperlink.make_with_content (<<>>)
			create l_base
			create l_base.make_with_content (<<>>)
			create l_body
			create l_body.make_with_content (<<>>)
			create l_br
			create l_br.make_with_content (<<>>)
			create l_div
			create l_div.make_with_content (<<>>)
			create l_footer
			create l_footer.make_with_content (<<>>)
			create l_h1
			create l_h1.make_with_content (<<>>)
			create l_h2
			create l_h2.make_with_content (<<>>)
			create l_h3
			create l_h3.make_with_content (<<>>)
			create l_h4
			create l_h4.make_with_content (<<>>)
			create l_h5
			create l_h5.make_with_content (<<>>)
			create l_h6
			create l_h6.make_with_content (<<>>)
			create l_head
			create l_head.make_with_content (<<>>)
			create l_form
			create l_form.make_with_content (<<>>)
			create l_img
			create l_img.make_with_content (<<>>)
			create l_input
			create l_input.make_with_content (<<>>)
			create l_li
			create l_li.make_with_content (<<>>)
			create l_link
			create l_link.make_with_content (<<>>)
			create l_meta
			create l_meta.make_with_content (<<>>)
			create l_nav
			create l_nav.make_with_content (<<>>)
			create l_ol
			create l_ol.make_with_content (<<>>)
			create l_p
			create l_p.make_with_content (<<>>)
			create l_page
			create l_page.make_with_content (<<>>)
			create l_script
			create l_script.make_with_content (<<>>)
			create l_style
			create l_style.make_with_content (<<>>)
			create l_table
			create l_table.make_with_content (<<>>)
			create l_td
			create l_td.make_with_content (<<>>)
			create l_th
			create l_th.make_with_content (<<>>)
			create l_title
			create l_title.make_with_content (<<>>)
			create l_tr
			create l_tr.make_with_content (<<>>)
			create l_ul
			create l_ul.make_with_content (<<>>)
		end

	html_components_tests
		-- `HTML_COMPONENTS_TESTS'

		local
			l_ul: HTML_UNORDERED_LIST
		do
			create l_ul
			assert_strings_equal ("empty_div_tags", empty_ul_any, l_ul.html_out)
		end

feature {NONE} -- Testing: {HTML_UNORDERED_LIST} Support

	empty_ul_any: STRING = "<div></div>"

end
