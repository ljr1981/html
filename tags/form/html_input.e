note
	description: "[
		Representation of an {HTML_INPUT}.
		]"

class
	HTML_INPUT

inherit
	HTML_TAG
		export {ANY}
			maxlength, set_maxlength,
			name, set_name,
			placeholder, set_placeholder,
			size, set_size,
			type, set_type
		end

	HTML_FORM_COMPONENT
		undefine
			default_create,
			out
		end

create
	default_create,
	make_with_content,
	make_with_attributes,
	make_as_checkbox,
	make_as_radio,
	make_as_text_field,
	make_as_submit_button

feature {NONE} -- Initialization

	make_as_checkbox (a_name, a_value: STRING)
			-- `make_as_text_field' of `a_name', `a_maxlength', and `a_size'.
		do
			make_with_attributes (checkbox_kw, a_name, a_value, empty_string, empty_string)
		end

	make_as_radio (a_name, a_value: STRING)
			-- `make_as_text_field' of `a_name' and `a_value'.
		do
			make_with_attributes (radio_kw, a_name, a_value, empty_string, empty_string)
		end

	make_as_submit_button
			-- `make_as_text_field'
		do
			make_with_attributes (submit_kw, empty_string, empty_string, empty_string, empty_string)
		end

	make_as_text_field (a_name, a_maxlength, a_size: STRING)
			-- `make_as_text_field' of `a_name', `a_maxlength', and `a_size'.
		do
			make_with_attributes (text_field_kw, a_name, empty_string, a_maxlength, a_size)
		end

	make_with_attributes (a_type, a_name, a_value, a_maxlength, a_size: STRING)
			-- `make_with_attributes' of `a_type', `a_name', `a_value', `a_maxlength', and `a_size'.
		require
			valid_type: (valid_types).has (a_type)
			valid_max: not a_maxlength.is_empty implies a_maxlength.is_integer
			valid_size: not a_size.is_empty implies a_size.is_integer
		do
			set_type (a_type)
			if not a_name.is_empty then
				set_name (a_name)
			end
			if not a_value.is_empty then
				set_value (a_value)
			end
			if not a_maxlength.is_empty then
				set_maxlength (a_maxlength)
			end
			if not a_size.is_empty then
				set_size (a_size)
			end
		end

feature -- Output

	tag_name: STRING = "input"
			-- <Precursor>

feature -- Basic Operations

	valid_types: ARRAY [STRING]
			-- `valid_types' for Current.
		once
			Result := <<"button", checkbox_kw, "color", "date", "datetime", "datetime-local", "email", "file", "hidden", "image", "month", "number", "assword", radio_kw, "range", "reset", "search", submit_kw, "tel", text_field_kw, "time", "url", "week">>
		end

feature -- Constants

	empty_string: STRING once create Result.make_empty end

	checkbox_kw: STRING = "checkbox"
	radio_kw: STRING = "radio"
	submit_kw: STRING = "submit"
	text_field_kw: STRING = "text"

note
	design: "[
Tag    Description
<input>    Specifies an input field where the user can enter data
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_input.asp"

end
