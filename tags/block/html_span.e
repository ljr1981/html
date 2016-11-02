note
	description: "[
		Representation of an {HTML_SPAN}.
		]"

class
	HTML_SPAN

inherit
	HTML_TAG
		export {ANY}
			aria_hidden, set_aria_hidden
		end

create
	default_create,
	make_with_content,
	make_with_raw_text

feature -- Output

	tag_name: STRING = "span"
			-- <Precursor>

;note
	design: "[
Tag    Description
<span>    Groups inline-elements in a document.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_span.asp"

end
