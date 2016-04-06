note
	description: "[
		Representation of an {HTML_META}.
		]"

class
	HTML_META

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
			-- HTML output for Current {HTML_META}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "meta"
			-- <Precursor>

;note
	design: "[
Tag    Description
<meta>    Defines metadata about an HTML document
		]"
	EIS: "name=meta", "src=http://www.w3schools.com/tags/tag_meta.asp"

end
