note
	description: "[
		Representation of an effected {HTML_RADIO_INPUT_FIELD}.
		]"

class
	HTML_RADIO_INPUT_FIELD

inherit
	HTML_DIV

	HTML_FORM_COMPONENT
		undefine
			default_create,
			out
		end

create
	make_with_data

feature {NONE} -- Initialization

	make_with_data (a_label, a_name, a_value: STRING; a_is_with_line_breaks: BOOLEAN)
			-- `make_with_data' of `a_label', `a_name', `a_values'.
			-- `a_label' is the label that will be given to the group.
			-- `a_name' is the key of the key:value pair for JSON.
			-- `a_value' is the value of the key:value pair for JSON.
			-- Male:<input type="radio" name="gender" value="Male"/><br/>
		do
			add_content (create {HTML_TEXT}.make_with_text (a_label))
			add_content (create {HTML_INPUT}.make_as_radio (a_name, a_value))
			if a_is_with_line_breaks then
				add_content (create {HTML_BR})
			end
		end

	with_line_breaks: BOOLEAN = True
	without_line_breaks: BOOLEAN = False

note
	design_intent: "[
		A radio input field in the form of: [Field_label] (*)
		]"

end
