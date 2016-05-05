note
	description: "[
		Representation of an {HTML_LINK}.
		]"

class
	HTML_LINK

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "link"
			-- <Precursor>

;note
	design: "[
Tag    Description
<link>    Defines the relationship between a document and an external resource
		]"
	EIS: "name=link", "src=http://www.w3schools.com/tags/tag_link.asp"

end
