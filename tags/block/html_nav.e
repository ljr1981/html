note
	description: "[
		Representation of an {HTML_NAV}.
		]"

class
	HTML_NAV

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Basic Operations

	add_link_and_text (a_link, a_text: STRING)
			--
		local
			l_li: HTML_LI
		do
			create l_li.make_with_link_and_text (a_link, a_text)
			add_content (l_li)
		end

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_NAV}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "nav"
			-- <Precursor>

;note
	design: "[
Tag    Description
<nav>    Defines a set of navigation links.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_nav.asp"

end
