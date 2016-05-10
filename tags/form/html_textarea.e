note
	description: "[
		Representation of an {HTML_TEXTAREA}.
		]"

class
	HTML_TEXTAREA

inherit
	HTML_TAG
		export {ANY}
			name
		end

create
	default_create,
	make_with_content

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
