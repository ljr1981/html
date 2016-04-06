note
	description: "[
		Representation of an {HTML_A_HYPERLINK}.
		]"

class
	HTML_A_HYPERLINK

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
			-- HTML output for Current {HTML_A_HYPERLINK}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "a"
			-- <Precursor>

;note
	design: "[
Tag    Description
<a>    Defines a hyperlink, which is used to link from one page to another
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_a.asp"

end
