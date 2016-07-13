note
	description: "[
		Representation of an effected {HTML_MARK}.
		]"

class
	HTML_MARK

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

	tag_name: STRING = "mark"
			-- <Precursor>

;note
	design: "[
Tag    Description
<p>    Defines small text
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_mark.asp"

end
