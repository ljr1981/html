note
	description: "[
		Representation of an {HTML_A}.
		]"

class
	HTML_A

inherit
	HTML_TAG
		export {ANY}
			href_attribute
		end

create
	default_create,
	make_with_content

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_A}.
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
