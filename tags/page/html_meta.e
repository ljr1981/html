note
	description: "[
		Representation of an {HTML_META}.
		]"

class
	HTML_META

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "meta"
			-- <Precursor>

;note
	design: "[
Tag    Description
<meta>    Defines metadata about an HTML document
		]"
	EIS: "name=meta", "src=http://www.w3schools.com/tags/tag_meta.asp"

end
