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

feature -- Test routines

	html_table_builder_tests
			-- `html_table_builder_tests'
		note
			EIS: "src=file:///C:/Users/LJR19/Documents/GitHub/html/tests/html_outs/build_editable_input_table.html"
		local
			l_builder: HTML_TABLE_BUILDER [MOCK_JSON_OBJECT]
			l_object: MOCK_JSON_OBJECT
			l_table: like new_table
			l_objects: HASH_TABLE [MOCK_JSON_OBJECT, STRING_8]
			l_delete_script_text: STRING
			l_delete_script: HTML_SCRIPT
			l_insert_script: HTML_SCRIPT
		do
			-- PREP WORK
			-- =============================
				-- Creations
			create l_builder

				-- Rubber-meets-road! We now ask our builder to build ...
			l_table := l_builder.build_editable_input_table (my_table_id, my_table_caption, test_mock_json_objects (2), not include_footers)

				-- Row deletion script
			l_delete_script_text := {JS_BASE}.delete_row_js_min.twin
				l_delete_script_text.replace_substring_all ("<<TABLE_NAME>>", my_table_id)
				l_delete_script := new_script
				l_delete_script.add_text_content (l_delete_script_text)
			l_insert_script := l_builder.build_table_row_insertion_script (my_table_id, my_table_caption, create {MOCK_JSON_OBJECT}, not include_footers)

				-- Output the results to a file where we can see it in the browser
			new_style.add_text_content (head_styles)
			new_div.add_content (l_table)
			output_page_to_browser (last_new_div, last_new_style, empty_body_styles, <<l_delete_script, l_insert_script>>, "build_editable_input_table")
		end

	test_mock_json_objects (a_count: INTEGER): HASH_TABLE [MOCK_JSON_OBJECT, STRING_8]
		do
				-- Construct objects to test with
			create Result.make (a_count)
			across
				from_1_to (a_count) as ic
			loop
				Result.force (create {MOCK_JSON_OBJECT}, ic.item.out)
			end
		end

	head_styles: STRING = "[
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

	html_file_ext: STRING = ".html"

	include_footers: BOOLEAN = True

end


