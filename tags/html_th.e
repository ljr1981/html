note
	description: "[
		Representation of an {HTML_TH}.
		]"

class
	HTML_TH

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
			-- HTML output for Current {HTML_TH}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "th"
			-- <Precursor>

;note
	design: "[
Tag    Description
<th>    Defines a header cell in an HTML table
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_th.asp"

end
