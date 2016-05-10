note
	description: "[
		Representation of an {HTML_LABEL}.
		]"

class
	HTML_LABEL

inherit
	HTML_TAG
		export {ANY}
			for
		end

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "label"
			-- <Precursor>

;note
	design: "[
		The <label> tag defines a label for an <input> element.

		The <label> element does not render as anything special for the user.
		However, it provides a usability improvement for mouse users, because
		if the user clicks on the text within the <label> element, it toggles
		the control.

		The for attribute of the <label> tag should be equal to the id attribute
		of the related element to bind them together.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_label.asp"

end
