note
	description: "[
		Representation of an {HTML_OL}.
		]"

class
	HTML_OL

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
			-- HTML output for Current {HTML_OL}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "ol"
			-- <Precursor>

;note
	design: "[
Tag    Description
<ol>    Defines an ordered list. An ordered list can be numerical or alphabetical
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_ol.asp"

end
