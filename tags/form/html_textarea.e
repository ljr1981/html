note
	description: "[
		Representation of an {HTML_TEXTAREA}.
		]"

class
	HTML_TEXTAREA

inherit
	HTML_TAG
		export {ANY}
			cols, set_cols,
			name, set_name,
			rows, set_rows,
			wrap, set_wrap,
			width, width_values, set_width
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

	make_with_data (a_wrap, a_name, a_text: STRING; a_cols, a_rows: INTEGER; a_is_line_break: BOOLEAN)
			-- `make_with_data' with `a_wrap', `a_name', `a_cols', and `a_rows'.
			-- wrap="physical" cols="20" name="quote" rows="5"
		require
			valid_name: not a_name.is_empty
		do
			set_wrap (a_wrap)
			set_name (a_name)
			if a_cols > 0 then
				set_cols (a_cols.out)
			end
			if a_rows > 0 then
				set_rows (a_rows.out)
			end
			add_text_content (a_text)
		end

feature -- Setters

	

feature -- Output

	tag_name: STRING = "textarea"
			-- <Precursor>

;note
	design: "[
	The <textarea> tag defines a multi-line text input control.

	A text area can hold an unlimited number of characters, and
	the text renders in a fixed-width font (usually Courier).

	The size of a text area can be specified by the cols and rows
	attributes, or even better; through CSS' height and width properties.
	]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_textarea.asp"

end
