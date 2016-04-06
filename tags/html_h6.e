note
	description: "[
		Representation of an {HTML_H6}.
		]"

class
	HTML_H6

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
			-- HTML output for Current {HTML_H6}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "h6"
			-- <Precursor>

;note
	design: "[
Tag    Description
<h6>    used to define HTML heading
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_hn.asp"

end
