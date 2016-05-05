note
	description: "[
		Representation of an {HTML_DIV}.
		]"

class
	HTML_DIV

inherit
	HTML_TAG
		export {ANY}
			role
		end

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "div"
			-- <Precursor>

;note
	design: "[
Tag    Description
<div>    Defines a division or a section in an HTML document
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_div.asp"

end
