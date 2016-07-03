note
	description: "[
		Representation of an {HTML_STRONG}.
		]"

class
	HTML_STRONG

inherit
	HTML_TAG
		export {ANY}
			-- not yet
		end

create
	default_create,
	make_with_content,
	make_with_raw_text

feature -- Output

	tag_name: STRING = "strong"
			-- <Precursor>

;note
	design: "[
		Tag    		Description
		<strong>    Defines a strong text
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_strong.asp"

end
