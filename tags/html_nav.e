note
	description: "[
		Representation of an {HTML_NAV}.
		]"

class
	HTML_NAV

inherit
	HTML_TAG

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
