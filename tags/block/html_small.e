note
	description: "[
		Representation of an effected {HTML_SMALL}.
		]"

class
	HTML_SMALL

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

	tag_name: STRING = "small"
			-- <Precursor>

;note
	design: "[
Tag    Description
<p>    Defines small text
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_small.asp"

end
