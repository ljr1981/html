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

feature -- Setters

	set_id_and_href (a_id, a_href: STRING)
			-- `set_id_and_href' with `a_id' and `a_href'.
			-- Example: <header id="#" href="blah"> ... </header>
		local
			l_a: HTML_A
		do
			create l_a.make_with_id_and_href (a_id, a_href)
			add_content (l_a)
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
