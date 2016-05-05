note
	description: "[
		Representation of an {HTML_BASE}.
		]"

class
	HTML_BASE

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "base"
			-- <Precursor>

;note
	design: "[
Tag    Description
<base>    Defines a default address or a default target for all links on a page
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_base.asp"

end
