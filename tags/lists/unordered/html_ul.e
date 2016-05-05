note
	description: "[
		Representation of an {HTML_UL}.
		]"

class
	HTML_UL

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "ul"
			-- <Precursor>

;note
	design: "[
Tag    Description
<ul>    Defines an unordered (bulleted) list
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_ul.asp"

end
