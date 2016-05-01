note
	description: "[
		Representation of an {HTML_CODE}.
		]"

class
	HTML_CODE

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_CODE}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "code"
			-- <Precursor>

;note
	design: "[
Tag    Description
<code>    Defines a code
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_code.asp"

end
