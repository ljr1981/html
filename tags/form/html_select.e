note
	description: "[
		Representation of an {HTML_SELECT}.
		]"

class
	HTML_SELECT

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_SELECT}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "select"
			-- <Precursor>

;note
	design: "[
		The <select> element is used to create a drop-down list.

		The <option> tags inside the <select> element define the
		available options in the list.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_select.asp"

end
