note
	description: "<table> builder(s) based on {JSON_TRANSFORMABLE} items."
	design: "[
		Given a set or list of {G}, create a table that is:
		
		(1) Column-Sortable
		(2) Row-Insertable
		(3) Row-deleteable
		(4) CSS-presentation-pliable
		(5) Editable (by way of <input> tags w/type-masking|controlling)
		]"

class
	HTML_TABLE_BUILDER [G -> JSON_TRANSFORMABLE create default_create end]

inherit
	HTML_FACTORY

feature -- Primary Builders

	build_editable_table_components (a_id: STRING; a_caption: detachable STRING; a_objects: HASH_TABLE [G, STRING]; a_include_footers: BOOLEAN): TUPLE [table: HTML_TABLE; body_scripts: ARRAY [HTML_SCRIPT]]
		local
			l_table: like new_table
			l_delete_script,
			l_insert_script,
			l_sort_script: HTML_SCRIPT
			l_js,
			l_delete_script_text: STRING
		do
			l_table := build_editable_new_table (a_id, a_caption, a_objects, a_include_footers)

				-- Row deletion, insert scripts
			l_delete_script_text := {JS_BASE}.delete_row_js_min_template.twin
				l_delete_script_text.replace_substring_all ({JS_BASE}.table_name_rtag, a_id)
				l_delete_script := new_script
				l_delete_script.add_text_content (l_delete_script_text)
			l_insert_script := build_table_row_insertion_script (a_id)
				-- Column sorting scripts
			l_js := {JS_BASE}.sort_table_js_min_template.twin
				l_js.replace_substring_all ({JS_BASE}.table_name_rtag, a_id)
				new_script.add_text_content (l_js)
				l_sort_script := last_new_script
			Result := [l_table, <<l_delete_script, l_insert_script, l_sort_script>>]
		end

	build_editable_new_table (a_id: STRING; a_caption: detachable STRING; a_objects: HASH_TABLE [G, STRING]; a_include_footers: BOOLEAN): like new_table
			-- `build_editable_new_table', give `new_table' `a_id' and optional `a_caption', filling with `a_objects'.
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
			has_caption_if_sent: attached a_caption as al_caption implies not al_caption.is_empty
			has_one: not a_objects.is_empty
		local
			l_spec_obj: G -- to obtain specs like metadata, attributes_hash_on_name, et al
		do
			l_spec_obj := a_objects.iteration_item (1)
			Result := new_table
				last_new_table.set_id (a_id)
				last_new_table.set_attribute_manual ("data-rowcount", a_objects.count.out, not is_quoted)

				-- Row insertion
--				last_new_table.add_content (new_input)
--					last_new_input.set_type (button_type_kw)
--					last_new_input.set_value (add_button_name)
--					last_new_input.set_on_click (js_fn_name (insert_row_fn_text, empty_args))

						-- Gen: Captions, Colgroup, Cols, Headers, and Footers
					if attached a_caption as al_caption then
						last_new_table.add_content (build_table_new_caption (a_id, a_caption))
					end

					metadata_is_for_output (l_spec_obj, refresh).do_nothing

					last_new_table.add_content (build_table_new_colgroup (a_id, l_spec_obj))
					last_new_table.add_content (build_table_new_thead (a_id, l_spec_obj))
					if a_include_footers then
						last_new_table.add_content (build_table_new_tfoot (a_id, l_spec_obj))
					end

						-- Gen: Rows with cells
					across
						a_objects as ic_objs
					loop
						last_new_table.add_content (build_table_new_tr (a_id, ic_objs.item, ic_objs.cursor_index))
					end
			-- end of new table
		end

feature -- Supporting Builders

	build_row_deletion_new_input (a_on_click_arg: STRING): like new_input
		do
			new_input.set_value (delete_button_name)
				last_new_input.set_type (button_type_kw)
				last_new_input.set_on_click (js_fn_name (delete_row_fn_text, a_on_click_arg))
			Result := last_new_input.twin
		end

	build_table_new_caption (a_id, a_caption: STRING): like new_caption
		do
			new_caption.add_text_content (a_caption)
				new_text_content.append_string_general (a_id)
				last_new_text_content.append_string_general (Caption_suffix)
				last_new_caption.set_id (last_new_text_content)
				last_new_caption.set_class_names (last_new_text_content)
			Result := last_new_caption.twin
		end

	build_table_new_colgroup (a_id: STRING; a_spec_obj: G): like new_colgroup
		local
			l_col_string,
			l_classes,
			l_col_short: STRING
			l_col_number: INTEGER
		do
			new_colgroup.do_nothing
			across
				metadata (a_spec_obj, not refresh) as ic_metadata
			from
				l_col_number := 1
			loop
				if metadata_is_for_output (a_spec_obj, not refresh) [ic_metadata.cursor_index] then
					last_new_colgroup.add_content (new_col)

					l_col_string := a_id.twin
					l_col_string.append_string_general (Col_suffix)
					l_col_short := l_col_string.twin
					l_col_string.append_character (hyphen_char)
					l_col_string.append_character (col_char)
					l_col_string.append_string_general (l_col_number.out)

					last_new_col.set_id (l_col_string)

					l_classes := l_col_short.twin
					l_classes.append_character (space_char)
					l_classes.append_string_general (l_col_string)

					last_new_col.set_class_names (l_classes)

					l_col_number := l_col_number + 1
				end
			end
			Result := last_new_colgroup.twin
		end

	build_table_new_thead (a_id: STRING; a_spec_obj: G): like new_thead
		local
			l_ftr_string,
			l_classes,
			l_ftr_short: STRING
			l_col_number: INTEGER
		do

			new_thead.add_content (new_tr)
			across
				a_spec_obj.convertible_features (a_spec_obj) as ic_attrs
			from
				l_col_number := 1
			loop
				if metadata_is_for_output (a_spec_obj, not refresh) [ic_attrs.cursor_index] then
					last_new_tr.add_content (new_th)

					l_ftr_string := a_id.twin
					l_ftr_string.append_string (Header_suffix)
					l_ftr_short := l_ftr_string.twin
					l_ftr_string.append_character (hyphen_char)
					l_ftr_string.append_character (col_char)
					l_ftr_string.append_string (l_col_number.out)

					last_new_th.set_id (l_ftr_string)

					l_classes := l_ftr_short.twin
					l_classes.append_character (space_char)
					l_classes.append_string_general (l_ftr_string)

					last_new_th.set_class_names (l_classes)
					if attached metadata (a_spec_obj, not refresh) [ic_attrs.cursor_index].name as al_header_name then
						last_new_th.add_text_content (al_header_name)
					else
						--last_new_th.add_text_content (ic_attrs.item)
					end
					last_new_th.set_on_click (js_fn_name (sort_table_fn_text, (l_col_number - 1).out)) -- "-1" is due to JS zero-based array

					l_col_number := l_col_number + 1
				end
			end
			last_new_tr.add_content (new_th)
			last_new_th.add_content (new_button)
				last_new_button.set_text_content ("Add")
				last_new_button.set_on_click (js_fn_name (insert_row_fn_text, add_at_top.out.as_lower))

			Result := last_new_thead.twin
		end

	add_at_top: BOOLEAN = True

	build_table_new_tfoot (a_id: STRING; a_spec_obj: G): like new_tfoot
		local
			l_hdr_string,
			l_classes,
			l_hdr_short: STRING
			l_col_number: INTEGER
		do
			new_tfoot.add_content (new_tr)
				across
					a_spec_obj.convertible_features (a_spec_obj) as ic_attrs
				from
					l_col_number := 1
				loop
					if metadata_is_for_output (a_spec_obj, not refresh) [ic_attrs.cursor_index] then
						last_new_tr.add_content (new_th)
							l_hdr_string := a_id.twin
							l_hdr_string.append_string (footer_suffix)
							l_hdr_short := l_hdr_string.twin
							l_hdr_string.append_character (hyphen_char)
							l_hdr_string.append_character (col_char)
							l_hdr_string.append_string (l_col_number.out)
							last_new_th.set_id (l_hdr_string)

							l_classes := l_hdr_short.twin
							l_classes.append_character (space_char)
							l_classes.append_string_general (l_hdr_string)
							last_new_th.set_class_names (l_classes)

							last_new_th.add_text_content (ic_attrs.item)
						l_col_number := l_col_number + 1
					end
				end
			Result := last_new_tfoot.twin
		end

	build_metadata_new_input (a_metadata: JSON_METADATA): like new_input
		do
				-- Set type, name, and value (deafult_value)
			new_input.set_type (a_metadata.type)
			if attached a_metadata.name as al_name and then not al_name.is_empty then
				last_new_input.set_name (al_name)
			end
			if attached a_metadata.default_value as al_value and then not al_value.is_empty then
				last_new_input.set_value (al_value)
			end

			if a_metadata.type.same_string ("number") then
				last_new_input.set_attribute_manual ("min", a_metadata.min_attached.out, not is_quoted)
				last_new_input.set_attribute_manual ("max", a_metadata.max_attached.out, not is_quoted)
			elseif a_metadata.type.same_string ("password") then
				last_new_input.set_maxlength (a_metadata.maxlength_attached.out)
			elseif a_metadata.type.same_string ("checkbox") then
				last_new_input.set_attribute_manual ("checked", a_metadata.is_checked.out, is_quoted)
			elseif a_metadata.type.same_string ("range") then
				last_new_input.set_attribute_manual ("min", a_metadata.min_attached.out, not is_quoted)
				last_new_input.set_attribute_manual ("max", a_metadata.max_attached.out, not is_quoted)
			elseif a_metadata.type.same_string ("image") then
				last_new_input.set_src (a_metadata.src_attached)
				last_new_input.set_attribute_manual ("alt", a_metadata.alt_attached, is_quoted)
				last_new_input.set_attribute_manual ("width", a_metadata.width_attached.out, not is_quoted)
				last_new_input.set_attribute_manual ("height", a_metadata.height_attached.out, not is_quoted)
			end

			Result := last_new_input.twin
		end

	build_table_new_tr (a_id: STRING; a_object: G; a_row_number: INTEGER): like new_tr
		local
			l_inp_string,
			l_classes: STRING
			l_col_number: INTEGER
		do
			new_tr.do_nothing
			across
				a_object.attributes_hash_on_name (a_object) as ic_attrs
			from
				l_col_number := 1
			loop
				if metadata_is_for_output (a_object, not refresh)[ic_attrs.cursor_index] then
					ic_attrs.item.call ([Void])
					last_new_tr.add_content (new_td)
						last_new_td.add_content (new_input)
							l_inp_string := a_id.twin
							l_inp_string.append_string_general (Input_suffix)
							l_classes := l_inp_string.twin
							l_inp_string.append_character (hyphen_char)
							l_inp_string.append_character (row_char)
							l_inp_string.append_string_general (a_row_number.out)
							l_classes.append_character (space_char)
							l_classes.append_string_general (l_inp_string)
							l_inp_string.append_character (hyphen_char)
							l_inp_string.append_character (col_char)
							l_inp_string.append_string_general (a_row_number.out)
							l_classes.append_character (space_char)
							l_classes.append_string_general (l_inp_string)

							last_new_input.set_id (l_inp_string)

							l_classes.append_character (space_char)
							l_classes.append_string_general (a_id.twin)
							l_classes.append_string_general (input_suffix)
							l_classes.append_character (hyphen_char)
							l_classes.append_character (col_char)
							l_classes.append_string_general (l_col_number.out)

							last_new_input.set_class_names (l_classes)

							if attached ic_attrs.item.last_result as al_last_result then
								last_new_input.set_value (al_last_result.out)
								check has_type: attached {STRING} a_object.metadata (a_object)[ic_attrs.cursor_index].type as al_metadata then
									last_new_input.set_type (al_metadata) -- See {JSON_TRANSFORMABLE}.valid_types
								end
							end
						l_col_number := l_col_number + 1
				end
			end
				-- Row deletion
			last_new_tr.add_content (new_td)
				last_new_td.add_content (build_row_deletion_new_input (this_js_kw))
			Result := last_new_tr.twin
		end

feature -- Metadata

	metadata (a_object: G; a_refresh: BOOLEAN): like {G}.metadata
		do
			Result := metadata_attached (a_object, a_refresh)
		end

	metadata_is_required (a_object: G; a_refresh: BOOLEAN): ARRAY [BOOLEAN]
			-- `metadata_is_required' from `a_object', `a_refresh' if True.
			-- Follows once-per-object pattern with using: once ("object").
			-- Offers convenience of refreshing the "onced" object if needed.
		do
			if not a_refresh and then attached metadata_is_required_internal as al_result then
				Result := al_result
			else
				Result := metadata_is_required_attached (a_object, a_refresh)
			end
		end

	metadata_is_for_output (a_object: G; a_refresh: BOOLEAN): ARRAY [BOOLEAN]
			-- `metadata_is_for_output' from `a_object', `a_refresh' if True.
			-- Follows once-per-object pattern with using: once ("object").
			-- Offers convenience of refreshing the "onced" object if needed.
		do
			if not a_refresh and then attached metadata_is_for_output_internal as al_result then
				Result := al_result
			else
				Result := metadata_is_for_output_attached (a_object, a_refresh)
			end
		end

feature {NONE} -- Metadata: Internals

	metadata_attached (a_object: G; a_refresh: BOOLEAN): like {G}.metadata
		do
			if a_refresh and then attached metadata_internal as al_result then
				Result := al_result
			else
				Result := a_object.metadata (a_object)
				metadata_internal := Result
			end
		end

	metadata_internal: detachable like {G}.metadata

	metadata_is_required_attached (a_object: G; a_refresh: BOOLEAN): ARRAY [BOOLEAN]
			-- `metadata_is_required_attached' once-per-object patterned.
			-- See also `metadata_is_required_internal'.
			-- Temporary replacement for the once ("object") pattern.
		do
			check attached metadata (a_object, a_refresh) as al_meta then
				create Result.make_filled (False, 1, al_meta.count)
				across
					al_meta as ic_meta
				loop
					Result [ic_meta.cursor_index] := ic_meta.item.is_required
					metadata_is_required_internal := Result
				end
			end
		end

	metadata_is_required_internal: detachable ARRAY [BOOLEAN]

	metadata_is_for_output_attached (a_object: G; a_refresh: BOOLEAN): ARRAY [BOOLEAN]
			-- `metadata_is_for_output_attached' once-per-object patterned.
			-- See also `metadata_is_for_output_internal'.
			-- Temporary replacement for the once ("object") pattern.
		do
			check attached metadata (a_object, a_refresh) as al_meta then
				create Result.make_filled (False, 1, al_meta.count)
				across
					al_meta as ic_meta
				loop
					Result [ic_meta.cursor_index] := ic_meta.item.is_for_output
					metadata_is_for_output_internal := Result
				end
			end
		end

	metadata_is_for_output_internal: detachable ARRAY [BOOLEAN]

feature -- JavaScript

	js_fn_name (a_function, a_args: STRING): STRING
		do
			Result := a_function.twin
			Result.append_character ('(')
			Result.append_string_general (a_args)
			Result.append_character (')')
		end

	build_table_row_insertion_script (a_id: STRING): like new_script
			-- `build_table_row_insertion_script' using `a_id' and `a_caption' for <table>
			--		and filling a row with `a_object', with optional <tfoot>s.
		require
			has_id: not a_id.is_empty
		local
			l_js,
			l_row_insertion_js: STRING
			l_del_button_js: STRING
			l_col_number: INTEGER
			l_def_value_text: STRING
			l_object: G
		do
			create l_object
			-- For <table> `a_id', and each <col> of it,
			-- Construct a Javascript <script>, building each <col> according to metadata in `a_objects'
			l_js := {JS_BASE}.table_row_insertion_js_template.twin
			l_js.replace_substring_all ({JS_BASE}.table_name_rtag, a_id)
			create l_row_insertion_js.make_empty
			across
				l_object.attributes_hash_on_name (l_object) as ic_attrs
			from
				l_col_number := 1
			loop
				if metadata_is_for_output (l_object, not refresh)[ic_attrs.cursor_index] then
					l_def_value_text := build_metadata_new_input (l_object.metadata (l_object)[ic_attrs.cursor_index]).html_out
					l_def_value_text.replace_substring_all (double_quote, esc_double_quote)
					l_row_insertion_js.append_string_general (build_table_row_cell_insertion_script (l_col_number, l_def_value_text))
					l_col_number := l_col_number + 1
				end
			end
			l_del_button_js := build_row_deletion_new_input (this_js_kw).html_out
			l_del_button_js.replace_substring_all (double_quote, esc_double_quote)
			l_row_insertion_js.append_string_general (build_table_row_cell_insertion_script (l_col_number, l_del_button_js))
			l_js.replace_substring_all ({JS_BASE}.row_insertion_scripts_rtag, l_row_insertion_js)

			new_script.add_text_content (l_js)
			Result := last_new_script.twin
		end

	build_table_row_cell_insertion_script (a_col_number: INTEGER; a_default_value_text: STRING): STRING
		do
			Result := {JS_BASE}.table_row_cell_insertion_js_template.twin
			Result.replace_substring_all ({JS_BASE}.col_number_rtag, (a_col_number - 1).out)
			Result.replace_substring_all ({JS_BASE}.default_value_text_rtag, a_default_value_text)
		end

feature -- Constants

	double_quote: STRING = "%""

	esc_double_quote: STRING = "\%""
			-- `esc_double_quote' used to replace `double_quote' in strings inserted into "innerHTML" on html-injections.

	this_js_kw: STRING = "this"

	button_type_kw: STRING = "button"

	add_button_name: STRING = "Add"

	delete_button_name: STRING = "Delete"

	insert_row_fn_text: STRING = "insertRow"

	sort_table_fn_text: STRING = "sortTable"

	delete_row_fn_text: STRING = "deleteRow"

	empty_args: STRING = ""

	refresh: BOOLEAN = True

	is_quoted: BOOLEAN = True

	caption_suffix: STRING = "-caption"

	col_suffix: STRING = "-col"

	col_char: CHARACTER = 'c'

	row_char: CHARACTER = 'r'

	header_suffix: STRING = "-hdr"

	footer_suffix: STRING = "-ftr"

	input_suffix: STRING = "-inp"

	hyphen_char: CHARACTER = '-'

	space_char: CHARACTER = ' '

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
