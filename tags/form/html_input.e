note
	description: "[
		Representation of an {HTML_INPUT}.
		]"

class
	HTML_INPUT

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "input"
			-- <Precursor>

;note
	design: "[
Tag    Description
<input>    Specifies an input field where the user can enter data
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_input.asp"

end
