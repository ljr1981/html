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

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_DL}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "dl"
			-- <Precursor>

;note
	design: "[
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_dl.asp"

end
