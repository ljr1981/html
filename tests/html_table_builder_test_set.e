note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	HTML_TABLE_BUILDER_TEST_SET

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

	HTML_FACTORY
		undefine
			default_create
		end

	RANDOMIZER
		undefine
			default_create
		end

feature -- Table CSS Dressup

	table_dressup_tests
			-- Play "dressup" with CSS on the same table structure
			-- 	(i.e. prove that we can change how the table looks/feels based only on CSS)
		note
			EIS: "src=https://www.w3schools.com/css/css_table.asp" -- based on ...
			EIS: "src=file:///C:/Users/LJR19/Documents/GitHub/html/tests/html_outs/css_dressup_1.html"
			EIS: "src=file:///C:/Users/LJR19/Documents/GitHub/html/tests/html_outs/css_dressup_2.html"
			EIS: "src=file:///C:/Users/LJR19/Documents/GitHub/html/tests/html_outs/css_dressup_3.html"
			EIS: "src=file:///C:/Users/LJR19/Documents/GitHub/html/tests/html_outs/css_dressup_4.html"
			EIS: "src=file:///C:/Users/LJR19/Documents/GitHub/html/tests/html_outs/css_dressup_5.html"
			EIS: "src=file:///C:/Users/LJR19/Documents/GitHub/html/tests/html_outs/css_dressup_6.html"
		do
				-- `css_dressup_1'
			new_style.add_text_content (css_dressup_1)
			new_div.add_content (stable_table_stuff.table)
				last_new_div.set_style ("overflow-x:auto;")
			output_page_to_browser (last_new_div, last_new_style, empty_body_styles, stable_table_stuff.body_scripts, "css_dressup_1")
				-- `css_dressup_2'
			new_style.add_text_content (css_dressup_2)
			new_div.add_content (stable_table_stuff.table)
				last_new_div.set_style ("overflow-x:auto;")
			output_page_to_browser (last_new_div, last_new_style, empty_body_styles, stable_table_stuff.body_scripts, "css_dressup_2")
				-- `css_dressup_3'
			new_style.add_text_content (css_dressup_3)
			new_div.add_content (stable_table_stuff.table)
				last_new_div.set_style ("overflow-x:auto;")
			output_page_to_browser (last_new_div, last_new_style, empty_body_styles, stable_table_stuff.body_scripts, "css_dressup_3")
				-- `css_dressup_4'
			new_style.add_text_content (css_dressup_4)
			new_div.add_content (stable_table_stuff.table)
				last_new_div.set_style ("overflow-x:auto;")
			output_page_to_browser (last_new_div, last_new_style, empty_body_styles, stable_table_stuff.body_scripts, "css_dressup_4")
				-- `css_dressup_5'
			new_style.add_text_content (css_dressup_5)
			new_div.add_content (stable_table_stuff.table)
				last_new_div.set_style ("overflow-x:auto;")
			output_page_to_browser (last_new_div, last_new_style, empty_body_styles, stable_table_stuff.body_scripts, "css_dressup_5")
				-- `css_dressup_6'
			new_style.add_text_content (css_dressup_6)
			new_div.add_content (stable_table_stuff.table)
				last_new_div.set_style ("overflow-x:auto;")
			output_page_to_browser (last_new_div, last_new_style, empty_body_styles, stable_table_stuff.body_scripts, "css_dressup_6")
		end

	css_dressup_1: STRING = "[
caption,table {
    border-collapse: collapse;
}

caption,table, th, td {
    border: 1px solid black;
}
]"

	css_dressup_2: STRING = "[
caption,table {
    border: 1px solid black;
}
]"

	css_dressup_3: STRING = "[
table {
    width: 100%;
}

th {
    height: 50px;
}
]"

	css_dressup_4: STRING = "[
table {
    width: 100%;
}

th {
    height: 50px;
}
th, td {
    border-bottom: 1px solid #ddd;
}
]"

	css_dressup_5: STRING = "[
table {
    width: 100%;
}

th {
    height: 50px;
}
th, td {
    border-bottom: 1px solid #ddd;
}
tr:hover {background-color: #f5f5f5}
]"

	css_dressup_6: STRING = "[
table {
    width: 100%;
}

th {
    background-color: #4CAF50;
    color: white;
    height: 50px;
}
th, td {
    border-bottom: 1px solid #ddd;
}
tr:hover {background-color: #f5f5f5}
tr:nth-child(even) {background-color: #f2f2f2}
]"

feature -- Table Builder

	html_table_builder_tests
			-- `html_table_builder_tests'
		note
			EIS: "src=file:///C:/Users/LJR19/Documents/GitHub/html/tests/html_outs/build_editable_input_table.html"
		do
			new_style.add_text_content (head_styles_css)
			new_div.add_content (stable_table_stuff.table)

			output_page_to_browser (last_new_div, last_new_style, empty_body_styles, stable_table_stuff.body_scripts, build_editable_input_table_file_name)
		end

	stable_table_stuff: like {HTML_TABLE_BUILDER [MOCK_JSON_OBJECT]}.build_editable_table_components
			-- `stable_table_stuff' provides a stable constant rendering of table components based on `test_mock_json_objects'.
		local
			l_builder: HTML_TABLE_BUILDER [MOCK_JSON_OBJECT]
			l_mocks: HASH_TABLE [MOCK_JSON_OBJECT, STRING_8]
		once
			-- PREP WORK
			-- =============================
				-- Creations: Builder and Mock Objects
			create l_builder

			l_mocks := test_mock_json_objects (2)
			across
				l_mocks as ic
			loop
				ic.item.metadata (ic.item) [1].reset_is_for_output
				ic.item.metadata (ic.item) [2].reset_is_for_output
				ic.item.metadata (ic.item) [3].reset_is_for_output
				ic.item.metadata (ic.item) [4].reset_is_for_output
			end

			-- BUILDER WORK
			-- =============================
				-- Rubber-meets-road! We now ask our builder to build ...
			Result := l_builder.build_editable_table_components (my_table_id, my_table_caption, l_mocks, not include_footers)
		end

	test_mock_json_objects (a_count: INTEGER): HASH_TABLE [MOCK_JSON_OBJECT, STRING_8]
		once
				-- Construct objects to test with
			create Result.make (a_count)
			across
				from_1_to (a_count) as ic
			loop
				Result.force (create {MOCK_JSON_OBJECT}, ic.item.out)
			end
		end

	head_styles_css: STRING = "[
caption,table,td {
  border: 1px solid grey;
  padding: 2px;
  cellpadding: 2px;
}
]"

feature {NONE} -- Implementation

	output_page_to_browser (a_div: HTML_DIV; a_head_style: detachable HTML_STYLE; a_body_styles: ARRAY [HTML_STYLE]; a_body_scripts: ARRAY [HTML_SCRIPT]; a_file_name: STRING)
		local
			l_file: PLAIN_TEXT_FILE
		do
				-- Create the page
			new_page.do_nothing
				if attached a_head_style as al_head_style then
					last_new_page.head.add_content (al_head_style)
				end
				last_new_page.body.add_content (a_div)
				across
					a_body_styles as ic_body_styles
				loop
					last_new_page.body.add_content (ic_body_styles.item)
				end
				across
					a_body_scripts as ic_body_scripts
				loop
					last_new_page.body.add_content (ic_body_scripts.item)
				end

				-- write it to a file
			create l_file.make_create_read_write (test_html_outs_path_string + a_file_name + html_file_ext)
			l_file.put_string (last_new_page.html_out)
			l_file.close
		end

feature -- Constants

	my_table_id: STRING = "tab1"

	my_table_caption: STRING = "My Table"

	empty_head_style: detachable HTML_STYLE

	empty_body_styles: ARRAY [HTML_STYLE] once Result := <<>> end

	empty_body_scripts: ARRAY [HTML_SCRIPT] once Result := <<>> end

	test_html_outs_path_string: STRING = ".\tests\html_outs\"

	build_editable_input_table_file_name: STRING = "build_editable_input_table"

	html_file_ext: STRING = ".html"

	include_footers: BOOLEAN = True

end


