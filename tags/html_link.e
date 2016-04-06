note
	description: "[
		Representation of an {HTML_LINK}.
		]"

class
	HTML_LINK

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
			-- HTML output for Current {HTML_LINK}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "link"
			-- <Precursor>

;note
	design: "[
Tag    Description
<link>    Defines the relationship between a document and an external resource
		]"
	EIS: "name=link", "src=http://www.w3schools.com/tags/tag_link.asp"

end
