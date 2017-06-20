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
		do
			-- PREP WORK
			-- =============================
				-- Creations
			create l_object
			create l_builder

				-- Construct objects to test with
			create l_objects.make (2)
			across
				from_1_to (2) as ic
			loop
				create l_object
				l_objects.force (l_object, ic.item.out)
			end

				-- Rubber-meets-road! We now ask out builder to build ...
			l_table := l_builder.build_editable_input_table ("myTable", "My Table", l_objects)

				-- Output the results to a file where we can see it in the browser
			new_style.add_text_content (head_styles)
			new_div.add_content (l_table)
			output_page_to_browser (last_new_div, last_new_style, <<>>, <<>>, "build_editable_input_table")
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
			create l_file.make_create_read_write (".\tests\html_outs\" + a_file_name + ".html")
			l_file.put_string (last_new_page.html_out)
			l_file.close
		end

end


