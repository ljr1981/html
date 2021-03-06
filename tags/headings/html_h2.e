note
	description: "[
		Representation of an {HTML_H2}.
		]"

class
	HTML_H2

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "h2"
			-- <Precursor>

;note
	design: "[
Tag    Description
<h2>    used to define HTML heading
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_hn.asp"

end
