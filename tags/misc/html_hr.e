note
	description: "[
		Representation of an {HTML_HR}.
		]"

class
	HTML_HR

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
			Result := "<hr/>"
		end

	tag_name: STRING = "br"
			-- <Precursor>

;note
	design: "[
The <hr> tag defines a thematic break in an HTML page (e.g. a shift of topic).

The <hr> element is used to separate content (or define a change) in an HTML page.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_hr.asp"

end
