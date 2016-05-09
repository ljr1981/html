note
	description: "[
		Representation of an {HTML_A}.
		]"

class
	HTML_A

inherit
	HTML_TAG
		export {ANY}
			href,
			data_rel,
			data_transition
		end

create
	default_create,
	make_with_content,
	make_with_link_and_text

feature {NONE} -- Initialization

	make_with_link_and_text (a_link, a_text: STRING)
			-- `make_with_link_and_text' in `a_link' and `a_text'.
		do
			set_attribute_value (agent href, a_link)
			add_content (create {HTML_TEXT}.make_with_text (a_text))
			default_create
		end

feature -- Output

	tag_name: STRING = "a"
			-- <Precursor>

;note
	design: "[
Tag    Description
<a>    Defines a hyperlink, which is used to link from one page to another
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_a.asp"

end
