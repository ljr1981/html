note
	description: "[
		Representation of an {HTML_LI}.
		]"

class
	HTML_LI

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_LI}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "li"
			-- <Precursor>

;note
	design: "[
		The <li> tag defines a list item.

		The <li> tag is used in ordered lists(<ol>), unordered
		lists (<ul>), and in menu lists (<menu>).
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_li.asp"

end
