note
	description: "[
		Representation of an {HTML_P}.
		]"

class
	HTML_P

inherit
	HTML_TAG
		export {ANY}
			align, set_align
		end

create
	default_create,
	make_with_content,
	make_with_raw_text

feature -- Output

	tag_name: STRING = "p"
			-- <Precursor>

;note
	design: "[
Tag    Description
<p>    Defines a paragraph
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_p.asp"

end
