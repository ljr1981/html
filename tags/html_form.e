note
	description: "[
		Representation of an {HTML_FORM}.
		]"

class
	HTML_FORM

inherit
	ANY

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
			-- HTML output for Current {HTML_FORM}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "div"
			-- <Precursor>

;note
	design: "[
Tag    Description
<form>    used to create an HTML form for user input
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_form.asp"

end
