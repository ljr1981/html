note
	description: "[
		Representation of an {HTML_BR}.
		]"

class
	HTML_BR

inherit
	HTML_TAG
		export {NONE}
			add_content,
			add_contents
		redefine
			common_out
		end

create
	default_create,
	make_with_content

feature -- Output

	common_out (a_prettified: BOOLEAN): STRING_8
		do
			Result := "<br/>"
		end

	tag_name: STRING = "br"
			-- <Precursor>

;note
	design: "[
Tag    Description
<br>    Inserts a single line break
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_br.asp"

end
