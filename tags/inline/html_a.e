note
	description: "[
		Representation of an {HTML_A}.
		]"

class
	HTML_A

inherit
	HTML_TAG
		export {ANY}
			aria_label, set_aria_label,
			href, set_href,
			data_direction, set_data_direction,
			data_dismiss, set_data_dismiss,
			data_icon, set_data_icon,
			data_inline, set_data_inline,
			data_rel, set_data_rel,
			data_role, set_data_role,
			data_slide, set_data_slide,
			data_theme, set_data_theme,
			data_toggle, set_data_toggle,
			data_transition, set_data_transition,
			target, set_target
		redefine
			default_create
		end

create
	default_create,
	make_with_content,
	make_with_link_and_text,
	make_with_id_and_href

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			exclude_end_tag := True
			Precursor
		end

	make_with_link_and_text (a_link, a_text: STRING)
			-- `make_with_link_and_text' in `a_link' and `a_text'.
		do
			set_attribute_value (agent href, a_link)
			extend (create {HTML_TEXT}.make_with_text (a_text))
			default_create
		end

	make_with_id_and_href (a_id, a_href: STRING)
		do
			set_id (a_id)
			set_href (a_href)
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
