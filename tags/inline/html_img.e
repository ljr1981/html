note
	description: "[
		Representation of an {HTML_IMG}.
		]"

class
	HTML_IMG

inherit
	HTML_TAG
		export {ANY}
			src
		end

create
	default_create,
	make_with_content,
	make_with_src

feature -- Output

	tag_name: STRING = "img"
			-- <Precursor>

;note
	design: "[
Tag    Description
<img>    Defines an image in an HTML page
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_img.asp"

end
