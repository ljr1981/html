note
	description: "[
		Representation of an {HTML_H3}.
		]"

class
	HTML_H3

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "h3"
			-- <Precursor>

;note
	design: "[
Tag    Description
<h3>    used to define HTML heading
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_hn.asp"

end
