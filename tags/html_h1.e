note
	description: "[
		Representation of an {HTML_H1}.
		]"

class
	HTML_H1

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
			-- HTML output for Current {HTML_H1}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "h1"
			-- <Precursor>

;note
	design: "[
Tag    Description
<h1>    used to define HTML heading
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_hn.asp"

end
