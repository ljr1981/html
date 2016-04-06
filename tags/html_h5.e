note
	description: "[
		Representation of an {HTML_H5}.
		]"

class
	HTML_H5

inherit
	HTML_TAG

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_H5}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "h5"
			-- <Precursor>

;note
	design: "[
Tag    Description
<h5>    used to define HTML heading
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_hn.asp"

end
