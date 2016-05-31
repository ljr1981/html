note
	description: "[
		Representation of an effected {HTML_TEXT_INPUT_FIELD}.
		]"

class
	HTML_TEXT_INPUT_FIELD

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

	make_with_data (a_label, a_name, a_maxlength, a_size: STRING; a_is_with_line_breaks: BOOLEAN)
			-- `make_with_data' of `a_label', `a_name', `a_values'.
			-- `a_label' is the label that will be given to the group.
			-- `a_name' is the key of the key:value pair for JSON.
			-- First Name:<input type="text" name="fname" maxlength="12" size="12"/> <br/>
		do
			set_class ("form-group")

			new_label.set_text_content (a_label)
			add_content (last_new_label)

			last_new_input.set_class ("form-control")
			last_new_input.set_maxlength (a_maxlength)
			last_new_input.set_size (a_size)
			add_content (last_new_input)
			
			if a_is_with_line_breaks then
				add_content (create {HTML_BR})
			end
		end

	with_line_breaks: BOOLEAN = True
	without_line_breaks: BOOLEAN = False

note
	design_intent: "[
		This is a single text field in the form of [label]: [ ... ]
		]"

end
