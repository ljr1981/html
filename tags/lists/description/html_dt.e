note
	description: "[
		Representation of an {HTML_DT}.
		]"

class
	HTML_DT

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "dt"
			-- <Precursor>

;note
	design: "[
		The <dt> tag defines a term/name in a description list.

		The <dt> tag is used in conjunction with <dl> (defines a description
		list) and <dd> (describes each term/name).
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_dt.asp"

end
