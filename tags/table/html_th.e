note
	description: "[
		Representation of an {HTML_TH}.
		]"

class
	HTML_TH

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "th"
			-- <Precursor>

;note
	design: "[
Tag    Description
<th>    Defines a header cell in an HTML table
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_th.asp"

end
