note
	description: "[
		Representation of an {HTML_P}.
		]"

class
	HTML_P

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_P}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "p"
			-- <Precursor>

;note
	design: "[
Tag    Description
<p>    Defines a paragraph
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_p.asp"

end
