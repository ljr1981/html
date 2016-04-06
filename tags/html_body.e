note
	description: "[
		Representation of an {HTML_BODY}.
		]"

class
	HTML_BODY

inherit
	HTML_ANY

	HTML_TAG
		undefine
			default_create,
			out
		end

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

	tag_name: STRING = "body"
			-- <Precursor>

;note
	design: "[
Tag    Description
<body>    Defines the body of a document
		]"
	EIS: "name=title", "src=http://www.w3schools.com/tags/tag_body.asp"

end
