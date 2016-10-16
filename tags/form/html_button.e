note
	description: "[
		Representation of an {HTML_BUTTON}.
		]"

class
	HTML_BUTTON

inherit
	HTML_TAG
		export {ANY}
			data_target, set_data_target,
			data_toggle, set_data_toggle,
			type, set_type
		end

	HTML_FORM_COMPONENT
		undefine
			default_create,
			out
		end

create
	default_create,
	make_with_content

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_BUTTON}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "button"
			-- <Precursor>

;note
	design: "[
		The <button> tag defines a clickable button.

		Inside a <button> element you can put content, like text or images. This is the
		difference between this element and buttons created with the <input> element.

		Tip: Always specify the type attribute for a <button> element. Different browsers
		use different default types for the <button> element.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_button.asp"

end
