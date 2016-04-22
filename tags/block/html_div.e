note
	description: "[
		Representation of an {HTML_DIV}.
		]"

class
	HTML_DIV

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_DIV}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "div"
			-- <Precursor>

;note
	design: "[
Tag    Description
<div>    Defines a division or a section in an HTML document
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_div.asp"

end
