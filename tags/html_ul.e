note
	description: "[
		Representation of an {HTML_UL}.
		]"

class
	HTML_UL

inherit
	HTML_TAG

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_UL}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "ul"
			-- <Precursor>

;note
	design: "[
Tag    Description
<ul>    Defines an unordered (bulleted) list
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_ul.asp"

end
