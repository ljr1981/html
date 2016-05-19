note
	description: "[
		Representation of an {HTML_FORM}.
		]"

class
	HTML_FORM

inherit
	HTML_TAG
		export {ANY}
			on_submit,
			method, set_method,
			action
		end

create
	default_create,
	make_with_content

feature -- Adding Content

	add_h2 (a_text: STRING)
		do
			add_content (create {HTML_HEADLINE_X}.make_h2 (a_text))
		end

	add_text_input_field_group (a_data: TUPLE [fields: ARRAY [TUPLE [label: STRING_8; name: STRING_8; maxlength: STRING_8; size: STRING_8; line_breaks: BOOLEAN]]])
		do
			add_content (create {HTML_TEXT_INPUT_FIELD_GROUP}.make_with_data (a_data.fields))
		end

	add_radio_input_field_group (a_data: TUPLE [a_group_label: STRING_8; a_fields: ARRAY [TUPLE [label: STRING_8; name: STRING_8; value: STRING_8; line_breaks: BOOLEAN]]])
		do
			add_content (create {HTML_RADIO_INPUT_FIELD_GROUP}.make_with_data (a_data.a_group_label, a_data.a_fields))
		end

	add_checkbox_group (a_data: TUPLE [a_label, a_name: STRING_8; a_values: ARRAY [STRING_8]; a_is_with_line_breaks: BOOLEAN])
		do
			add_content (create {HTML_CHECKBOX_GROUP}.make_with_data (a_data.a_label, a_data.a_name, a_data.a_values, a_data.a_is_with_line_breaks))
		end

	add_textarea (a_data: TUPLE [a_wrap, a_name, a_text: STRING_8; a_cols, a_rows: INTEGER_32; a_is_line_break: BOOLEAN])
		do
			add_content (create {HTML_TEXTAREA}.make_with_data (a_data.a_wrap, a_data.a_name, a_data.a_text, a_data.a_cols, a_data.a_rows, a_data.a_is_line_break))
		end

	add_select_with_options (a_data: TUPLE [a_label, a_name: STRING_8; a_size: INTEGER_32; a_values: ARRAY [STRING_8]; a_is_line_break: BOOLEAN])
		do
			add_content (create {HTML_SELECT}.make_with_data (a_data.a_label, a_data.a_name, a_data.a_size, a_data.a_values, a_data.a_is_line_break))
		end

feature -- Output

	tag_name: STRING = "form"
			-- <Precursor>

;note
	design: "[
Tag    Description
<form>    used to create an HTML form for user input
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_form.asp"

end
