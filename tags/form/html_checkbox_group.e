note
	description: "[
		Representation of an effected {HTML_CHECKBOX_GROUP}.
		]"


class
	HTML_CHECKBOX_GROUP

inherit
	HTML_DIV

	HTML_FORM_COMPONENT
		undefine
			default_create,
			out
		end

create
	default_create,
	make_with_data

feature {NONE} -- Initialization

	make_with_data (a_label, a_name: STRING; a_values: ARRAY [STRING]; a_is_with_line_breaks: BOOLEAN)
			-- `make_with_data' of `a_label', `a_name', `a_values'.
			-- `a_label' is the label that will be given to the group.
			-- `a_name' is the key of the key:value pair for JSON.
			-- `a_values' is the values of the generated checkboxes.
		do
			add_content (create {HTML_TEXT}.make_with_text (a_label))
			if a_is_with_line_breaks then
				add_content (create {HTML_BR})
			end
			across
				a_values as ic_values
			loop
				add_content (create {HTML_TEXT}.make_with_text (ic_values.item))
				add_content (create {HTML_INPUT}.make_as_checkbox (a_name, ic_values.item))
				if a_is_with_line_breaks then
					add_content (create {HTML_BR})
				end
			end
		end

	with_line_breaks: BOOLEAN = True
	without_line_breaks: BOOLEAN = False

note
	design_intent: "[
		This is a collection of checkboxes in the form of:
		[label]
		[option 1] [x]
		[option 2] [x]
		...
		[option 2] [x]
		]"

end
