note
	description: "[
		Representation of an effected {HTML_RADIO_INPUT_FIELD_GROUP}.
		]"

class
	HTML_RADIO_INPUT_FIELD_GROUP

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

	make_with_data (a_group_label: STRING; a_fields: ARRAY [TUPLE [label, name, value: STRING; line_breaks: BOOLEAN]])
			-- `make_with_data' with `a_fields' array of labels, names, values, and line_breaks (t/f).
		do
			add_content (create {HTML_TEXT}.make_with_text (a_group_label))
			across
				a_fields as ic_fields
			loop
				add_content (create {HTML_RADIO_INPUT_FIELD}.make_with_data (ic_fields.item.label, ic_fields.item.name, ic_fields.item.value, ic_fields.item.line_breaks))
			end
		end

note
	design_intent: "[
		This is a group of text input fields with labels in the form of:
		
		[Field_label 1] (*)
		[Field_label 2] (*)
		...
		[Field_label n] (*)
		]"

end
