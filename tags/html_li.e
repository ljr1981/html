note
	description: "[
		Representation of an {HTML_LI}.
		]"

class
	HTML_LI

inherit
	HTML_ANY

	HTML_TAG
		undefine
			default_create,
			out
		end

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
Tag    Description
<li>    Defines a list item
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_li.asp"

end