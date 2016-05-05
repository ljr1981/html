note
	description: "[
		Representation of an {HTML_DD}.
		]"

class
	HTML_DD

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "dd"
			-- <Precursor>

;note
	design: "[
		The <dd> tag is used to describe a term/name in a description list.

		The <dd> tag is used in conjunction with <dl> (defines a description
		list) and <dt> (defines terms/names).

		Inside a <dd> tag you can put paragraphs, line breaks, images, links,
		lists, etc.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_dd.asp"

end
