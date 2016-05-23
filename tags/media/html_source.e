note
	description: "[
		Representation of an {HTML_SOURCE}.
		]"

class
	HTML_SOURCE

inherit
	HTML_TAG
		export {ANY}
			type, set_type
		end

create
	default_create

feature -- Output

	tag_name: STRING = "source"
			-- <Precursor>

;note
	design: "[

		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_source.asp"

end
