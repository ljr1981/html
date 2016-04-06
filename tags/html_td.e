note
	description: "[
		Representation of an {HTML_TD}.
		]"

class
	HTML_TD

inherit
	HTML_TAG

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_TD}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "td"
			-- <Precursor>

;note
	design: "[
Tag    Description
<td>    Defines a standard cell in an HTML table
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_td.asp"

end
