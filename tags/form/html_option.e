note
	description: "[
		Representation of an {HTML_OPTION}.
		]"

class
	HTML_OPTION

inherit
	HTML_TAG

	HTML_FORM_COMPONENT
		undefine
			default_create,
			out
		end

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "option"
			-- <Precursor>

;note
	design: "[
		The <option> tag defines an option in a select list.

		<option> elements go inside a <select> or <datalist> element.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_option.asp"

end
