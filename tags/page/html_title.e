note
	description: "[
		Representation of an {HTML_TITLE}.
		]"

class
	HTML_TITLE

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_TITLE}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "title"
			-- <Precursor>

;note
	design: "[
Tag    Description
<title>    Defines the title of a document
		]"
	EIS: "name=title", "src=http://www.w3schools.com/tags/tag_title.asp"

end
