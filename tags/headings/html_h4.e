note
	description: "[
		Representation of an {HTML_H4}.
		]"

class
	HTML_H4

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "h4"
			-- <Precursor>

;note
	design: "[
Tag    Description
<h4>    used to define HTML heading
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_hn.asp"

end
