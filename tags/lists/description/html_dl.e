note
	description: "[
		Representation of an {HTML_DL}.
		]"

class
	HTML_DL

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "dl"
			-- <Precursor>

;note
	design: "[
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_dl.asp"

end
