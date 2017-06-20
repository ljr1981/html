class
	HTML_TABLE_BUILDER [G -> JSON_TRANSFORMABLE]

inherit
	HTML_FACTORY

feature -- Builders

	build_editable_input_table (a_id: STRING; a_caption: detachable STRING; a_objects: HASH_TABLE [G, STRING]; a_include_footers: BOOLEAN): like new_table
			-- `build_editable_input_table', give `new_table' `a_id' and optional `a_caption', filling with `a_objects'.
			-- Editable by way of the HTML <input> tag element, with attending "type=" attributes, which control presentation by data type.
		note
			design: "[
				Responsible for creating just the HTML <table> tag structure.
				Some responsive aspects of the <table> are the result of responsive
				HTML tags (e.g. <input type="...">).
				
				Each element is auto-marked with a generated #ID and set of class names.
				For example:
					(1) Columns: <col class="tab1-col tab1-col-c1" id="tab1-col-c1"></col>
							Where: "tab1" = `a_id' (above). The "tab1-col" means that
									CSS can be applied to ALL table 1 columns, which
									translates to independently targeted table CSS.
									The "tab1-col1" is a little overkill in that you
									now have a choice to apply the <style> either to
									the <col>-by-id or to the <col>-by-class-name.
									Hence--do you want to apply CSS by #ID or by unique
									class-name? This depends on the JS mechanism you
									choose (GetElementByID or getElementsByClassName).
									Because the class-name is also unique in the DOM,
									the getElementsByClassName function ought to return
									an array of 1. This means you need extra code to
									pick up element #1, whereas the GetElementByID
									will return just the element (if found). Therefore,
									it does depend on what your purpose is, which way
									you choose. However, both ID and class-name are
									included at all levels to ensure multiple vectors
									of approach to CSS element-selection.
					(2) Headers: <th class="tab1-hdr tab1-hdr-c1" id="tab1-hdr-c1">my_string</th>
							Where: For each <th> in <thead>. As with <col>, the <th> ID 
									and class-name schema works precisely the same way 
									and with the same intended purpose.
					(3) Footers: Work the same as headers, but for each <th> in <tfoot>.
					(4) Inputs: <input class="tab1-inp tab1-inp-r1 tab1-inp-r1-c1 tab1-inp-c1" id="tab1-inp-r1-c1" type="text" value="some_string" />
							Where: Precisely the same idea for ID vs. class-name is applied
									to the <input> tag. Multi-vector CSS application ought
									not require more than what is supplied in the class-name.
									If entire columns are to have CSS applied, then that
									CSS ought to be targeted at either <col>-ID or <col>-class-name.
									Otherwise, one can target "tab1-inp", which will be every
									input field of Table #1 (e.g. the `a_id' passed above).
									One may also target <input> elements based on columns
									like "tab1-inp-c1", which is column #1 of <input>s for
									Table #1. This allows applying CSS to just the <input>
									elements of column #1.
				]"
			EIS: "name=GetElementByID", "src=https://www.w3schools.com/jsref/met_document_getelementbyid.asp"
			EIS: "name=getElementsByClassName", "src=https://www.w3schools.com/jsref/met_document_getelementsbyclassname.asp"
			plan: "[
				Design other features that take our `new_table' Result and "decorate"
				it with JS functions and (finally) CSS styling. See the 
				{HTML_TABLE_BUILDER_TEST_SET}.html_table_builder_tests (and related)
				for examples of this happening.
				]"
		require
			has_id: not a_id.is_empty
			has_one: not a_objects.is_empty
		local
			l_spec_obj: G -- to obtain specs like metadata, attributes_hash_on_name, et al
			l_caption_string,
			l_col_string,
			l_col_short,
			l_hdr_string,
			l_hdr_short,
			l_ftr_string,
			l_ftr_short,
			l_inp_string,
			l_inp_short,
			l_classes: STRING
		do
			l_spec_obj := a_objects.iteration_item (1)
			Result := new_table
			last_new_table.set_id (a_id)
				-- Row insertion
			last_new_table.add_content (new_input)
				last_new_input.set_type ("button")
				last_new_input.set_value ("Add")
				last_new_input.set_on_click ("insertRow()")

					-- Gen: Caption
				if attached a_caption as al_caption then
					last_new_table.add_content (new_caption)
						last_new_caption.add_text_content (al_caption)
						l_caption_string := a_id.twin
						l_caption_string.append_string_general (caption_suffix)
						last_new_caption.set_id (l_caption_string)
						last_new_caption.set_class_names (l_caption_string)
				end
					-- Gen: Colgroups / Cols
				last_new_table.add_content (new_colgroup)
				across
					l_spec_obj.metadata (l_spec_obj) as ic_metadata
				loop
					last_new_colgroup.add_content (new_col)
						l_col_string := a_id.twin
						l_col_string.append_string_general (col_suffix)
						l_col_short := l_col_string.twin
						l_col_string.append_character ('-')
						l_col_string.append_character ('c')
						l_col_string.append_string_general (ic_metadata.cursor_index.out)
						last_new_col.set_id (l_col_string)

						l_classes := l_col_short.twin
						l_classes.append_character (' ')
						l_classes.append_string_general (l_col_string)
						last_new_col.set_class_names (l_classes)
				end
					-- Gen: Headers
				last_new_table.add_content (new_thead)
					last_new_thead.add_content (new_tr)
				across
					l_spec_obj.convertible_features (l_spec_obj) as ic_attrs
				loop
					last_new_tr.add_content (new_th)
						l_ftr_string := a_id.twin
						l_ftr_string.append_string (header_suffix)
						l_ftr_short := l_ftr_string.twin
						l_ftr_string.append_character ('-')
						l_ftr_string.append_character ('c')
						l_ftr_string.append_string (ic_attrs.cursor_index.out)
						last_new_th.set_id (l_ftr_string)

						l_classes := l_ftr_short.twin
						l_classes.append_character (' ')
						l_classes.append_string_general (l_ftr_string)
						last_new_th.set_class_names (l_classes)

						last_new_th.add_text_content (ic_attrs.item)
				end
					-- Gen: Footers
				if a_include_footers then
					last_new_table.add_content (new_tfoot)
						last_new_tfoot.add_content (new_tr)
					across
						l_spec_obj.convertible_features (l_spec_obj) as ic_attrs
					loop
						last_new_tr.add_content (new_th)
							l_hdr_string := a_id.twin
							l_hdr_string.append_string (footer_suffix)
							l_hdr_short := l_hdr_string.twin
							l_hdr_string.append_character ('-')
							l_hdr_string.append_character ('c')
							l_hdr_string.append_string (ic_attrs.cursor_index.out)
							last_new_th.set_id (l_hdr_string)

							l_classes := l_hdr_short.twin
							l_classes.append_character (' ')
							l_classes.append_string_general (l_hdr_string)
							last_new_th.set_class_names (l_classes)

							last_new_th.add_text_content (ic_attrs.item)
					end
				end
					-- Gen: Rows with cells
				across
					a_objects as ic_objs
				loop
					last_new_table.add_content (new_tr)
					across
						ic_objs.item.attributes_hash_on_name (ic_objs.item) as ic_attrs
					loop
						ic_attrs.item.call ([Void])
						last_new_tr.add_content (new_td)
							last_new_td.add_content (new_input)
								l_inp_string := a_id.twin
								l_inp_string.append_string_general (input_suffix)
								l_classes := l_inp_string.twin
								l_inp_string.append_character ('-')
								l_inp_string.append_character ('r')
								l_inp_string.append_string_general (ic_objs.cursor_index.out)
								l_classes.append_character (' ')
								l_classes.append_string_general (l_inp_string)
								l_inp_string.append_character ('-')
								l_inp_string.append_character ('c')
								l_inp_string.append_string_general (ic_attrs.cursor_index.out)
								l_classes.append_character (' ')
								l_classes.append_string_general (l_inp_string)
								last_new_input.set_id (l_inp_string)

								l_classes.append_character (' ')
								l_classes.append_string_general (a_id.twin)
								l_classes.append_string_general (input_suffix)
								l_classes.append_character ('-')
								l_classes.append_character ('c')
								l_classes.append_string_general (ic_attrs.cursor_index.out)

								last_new_input.set_class_names (l_classes)

								if attached ic_attrs.item.last_result as al_last_result then
									last_new_input.set_value (al_last_result.out)
									check has_type: attached {STRING} ic_objs.item.metadata (ic_objs.item)[ic_attrs.cursor_index].type as al_metadata then
										last_new_input.set_type (al_metadata) -- See {JSON_TRANSFORMABLE}.valid_types
									end
								end
					end
					-- Row deletion
				last_new_tr.add_content (new_td)
					last_new_td.add_content (row_deletion_input_button ("this"))
			end
		end

	row_deletion_input_button (a_on_click_arg: STRING): like new_input
		do
			new_input.set_value ("Delete")
				last_new_input.set_type ("button")
				last_new_input.set_on_click ("deleteRow(" + a_on_click_arg + ")") -- e.g. "this"

			Result := last_new_input
		end

	build_table_row_insertion_script (a_id: STRING; a_caption: detachable STRING; a_object: G; a_include_footers: BOOLEAN): like new_script
		local
			l_js,
			l_row_insertion_js: STRING
			l_del_button_js: STRING
			l_row_number,
			l_col_number: INTEGER
			l_def_value_text: STRING
		do
			-- For <table> `a_id', and each <col> of it,
			-- Construct a Javascript <script>, building each <col> according to metadata in `a_objects'
			l_js := table_row_insertion_js.twin
			l_js.replace_substring_all ("<<TABLE_NAME>>", a_id)
			create l_row_insertion_js.make_empty
			across
				a_object.attributes_hash_on_name (a_object) as ic_attrs
			loop
				l_col_number := ic_attrs.cursor_index
				l_def_value_text := "def-value" -- REPLACE WITH metadata version of default value based on "type="
				l_row_insertion_js.append_string_general (build_table_row_cell_insertion_script (l_col_number, l_def_value_text))
			end
			l_del_button_js := row_deletion_input_button ("this").html_out
			l_del_button_js.replace_substring_all ("%"", "\%"")
			l_row_insertion_js.append_string_general (build_table_row_cell_insertion_script (a_object.attributes_hash_on_name (a_object).count + 1, l_del_button_js))
			l_js.replace_substring_all ("<<ROW_INSERTION_SCRIPTS>>", l_row_insertion_js)

			Result := new_script
			last_new_script.add_text_content (l_js)
		end

	table_row_insertion_js: STRING = "[
function insertRow() {
  var table = document.getElementById("<<TABLE_NAME>>");
  var count = table.rows.length;
  var row = table.insertRow(count);
  <<ROW_INSERTION_SCRIPTS>>
}
]"

	build_table_row_cell_insertion_script (a_col_number: INTEGER; a_default_value_text: STRING): STRING
		do
			Result := table_row_cell_insertion_js.twin
			Result.replace_substring_all ("<<COL_NUMBER>>", (a_col_number - 1).out)
			Result.replace_substring_all ("<<DEFAULT_VALUE_TEXT>>", a_default_value_text)
		end

	table_row_cell_insertion_js: STRING = "[
var cell<<COL_NUMBER>> = row.insertCell(<<COL_NUMBER>>);
cell<<COL_NUMBER>>.innerHTML = "<<DEFAULT_VALUE_TEXT>>";
]"

feature -- Constants

	caption_suffix: STRING = "-caption"

	col_suffix: STRING = "-col"

	header_suffix: STRING = "-hdr"

	footer_suffix: STRING = "-ftr"

	input_suffix: STRING = "-inp"

note
	design: "[
		Build tables that:
		==================
		(1) Sortable columns
		(2) Deletable rows (top-to-bottom)
		(3) Insertable rows (bottom, top, middle)
			(a) Button (top or bottom)
			(b) Tab-out trigger
		(4) Editable (contenteditable|<input>)
		(5) AJAX-able
			(a) Fetch from Server
			(b) Update to Server (full and partial of adds, changes, deletes)
		(6) Moveable rows
		(X) Cells that follow particular masking (e.g. see <input type="..."> EIS below)
				button			Defines a clickable button (mostly used with a JavaScript to activate a script)
				checkbox		Defines a checkbox
				color			Defines a color picker
				date			Defines a date control (year, month and day (no time))
				datetime-local	Defines a date and time control (year, month, day, hour, minute, second, and fraction of a second (no time zone)
				email			Defines a field for an e-mail address
				file			Defines a file-select field and a "Browse..." button (for file uploads)
				hidden			Defines a hidden input field
				image			Defines an image as the submit button
				month			Defines a month and year control (no time zone)
				number			Defines a field for entering a number
				password		Defines a password field (characters are masked)
				radio			Defines a radio button
				range			Defines a control for entering a number whose exact value is not important (like a slider control). Default range is from 0 to 100
				reset			Defines a reset button (resets all form values to default values)
				search			Defines a text field for entering a search string
				submit			Defines a submit button
				tel				Defines a field for entering a telephone number
				text	Default	Defines a single-line text field (default width is 20 characters)
				time			Defines a control for entering a time (no time zone)
				url				Defines a field for entering a URL
				week			Defines a week and year control (no time zone)		
		
		Preconditions:
		==============
		(1) Table-data must be flat file (e.g. equal rows and cols)
		(2) Columns must have easily discoverable column titles
		(3) Columns must have easily discoverable data types
		(4) Data for each cell must fit within a particular precision and range
		
		Road Forward:
		=============
		(1) Build a standard HTML-5 <table> from ...
			(a) HASH_TABLE [{JSON_TRANFORMABLE}, STRING], where {STRING} = PK (key)
			(b) HASH_TABLE [{JSON_TRANFORMABLE}, INTEGER], where {INTEGER} = PK (key) generic (no actual PK exists)
			(c) ARRAYED_LIST [{JSON_TRANFORMABLE}], where no PK exists
			(d) ARRAY [{JSON_TRANFORMABLE}], where no PK exists
		(1b) Tables will have the following standard (or optional*) ...
			(a) <colgroup> and <col>
			(b) <thead>
			(c) <tfoot>
			(d) <caption>*
		(1c) All <input type="..."> variants will be built (see list above)
		(1d) Tables will have auto-ID and auto-class'ing
			(a) Auto-ID: <table> #id provided by client-caller
			(b) Auto-ID: <tr><th><td><col><colgroup><input><etc...> will all be auto-ID'd
			(c) Auto-Class: Same things will also be given automatic class names
		(2) Add sorting capacity @ header level ...
			(a) Add JavaScript
			(b) Add HTML attributes
		(3) Add insert capacity ...
			(a) Add JavaScript
			(b) Add HTML attributes
		(4) Add deletion capacity ...
			(a) Add JavaScript
			(b) Add HTML attributes
		(5) Add AJAX capacity ...
			(a) Add JavaScript
			(b) Add HTML attributes
		]"
	EIS: "html_input_type", "src=https://www.w3schools.com/tags/att_input_type.asp"

end
