note
	description: "[
		Representation of an {HTML_H6}.
		]"

class
	HTML_H6

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "h6"
			-- <Precursor>

;note
	design: "[
Tag    Description
<h6>    used to define HTML heading
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_hn.asp"

end
