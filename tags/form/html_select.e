note
	description: "[
		Representation of an {HTML_SELECT}.
		]"

class
	HTML_SELECT

inherit
	HTML_TAG
		export {ANY}
			name, set_name,
			size, set_size, no_size
		end

	HTML_FORM_COMPONENT
		undefine
			default_create,
			out
		end

create
	default_create,
	make_with_content,
	make_with_data

feature {NONE} -- Initialization

	make_with_data (a_label, a_name: STRING; a_size: INTEGER; a_values: ARRAY [STRING]; a_is_line_break: BOOLEAN)
			-- `make_with_data' with `a_label', `a_name', and a list of `a_values'.
		do
			set_name (a_name)
			if a_size > 0 then
				set_size (a_size.out)
			end
			extend (create {HTML_TEXT}.make_with_text (a_label))
			if a_is_line_break then
				extend (create {HTML_BR})
			end
			across
				a_values as ic_values
			loop
				extend (create {HTML_OPTION}.make_with_content (<<create {HTML_TEXT}.make_with_text (ic_values.item)>>))
				if a_is_line_break then
					extend (create {HTML_BR})
				end
			end
		end

feature -- Output

	tag_name: STRING = "select"
			-- <Precursor>

;note
	design: "[
		The <select> element is used to create a drop-down list.

		The <option> tags inside the <select> element define the
		available options in the list.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_select.asp"

end
