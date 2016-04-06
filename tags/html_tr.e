note
	description: "[
		Representation of an {HTML_TR}.
		]"

class
	HTML_TR

inherit
	HTML_TAG

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_TR}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "tr"
			-- <Precursor>

;note
	design: "[
Tag    Description
<tr>    Defines a row in an HTML table
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_tr.asp"

end
