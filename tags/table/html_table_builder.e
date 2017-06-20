class
	HTML_TABLE_BUILDER [G -> JSON_TRANSFORMABLE]

inherit
	HTML_FACTORY

feature -- Builders

	build_editable_input_table (a_id: STRING; a_caption: detachable STRING; a_objects: HASH_TABLE [G, STRING]): like new_table
		require
			has_id: not a_id.is_empty
			has_one: not a_objects.is_empty
		local
			l_spec_obj: G -- to obtain specs like metadata, attributes_hash_on_name, et al
		do
			l_spec_obj := a_objects.iteration_item (1)
			Result := new_table
					-- Gen: Caption
				if attached a_caption as al_caption then
					last_new_table.add_content (new_caption)
						last_new_caption.add_text_content (al_caption)
						last_new_caption.set_id (a_id + "-caption")
						last_new_caption.set_class_names (a_id + "-caption")
				end
					-- Gen: Colgroups / Cols
				last_new_table.add_content (new_colgroup)
				across
					l_spec_obj.metadata (l_spec_obj) as ic_metadata
				loop
					last_new_colgroup.add_content (new_col)
						last_new_col.set_id (a_id + "-col" + ic_metadata.cursor_index.out)
				end
					-- Gen: Headers
				last_new_table.add_content (new_thead)
					last_new_thead.add_content (new_tr)
				across
					l_spec_obj.convertible_features (l_spec_obj) as ic_attrs
				loop
					last_new_tr.add_content (new_th)
						last_new_th.add_text_content (ic_attrs.item)
				end
					-- Gen: Footers
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
								if attached ic_attrs.item.last_result as al_last_result then
									last_new_input.set_value (al_last_result.out)
									check has_type: attached {STRING} ic_objs.item.metadata (ic_objs.item)[ic_attrs.cursor_index].type as al_metadata then
										last_new_input.set_type (al_metadata) -- See {JSON_TRANSFORMABLE}.valid_types
									end
								end
					end
				end
		end

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
