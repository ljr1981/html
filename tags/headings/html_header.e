note
	description: "[
		Representation of an {HTML_HEADER}.
		]"

class
	HTML_HEADER

inherit
	HTML_TAG
		export {ANY}
			href, set_href
		end

feature -- Output

	tag_name: STRING = "header"
			-- <Precursor>

;note
	design: "[
		The <header> element represents a container for introductory content or a set of navigational links.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_header.asp"


end
