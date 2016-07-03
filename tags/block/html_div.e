note
	description: "[
		Representation of an {HTML_DIV}.
		]"

class
	HTML_DIV

inherit
	HTML_TAG
		export {ANY}
			align, set_align,
			on_submit,
			role, set_role,
			data_x, set_data_x,
			data_y, set_data_y,
			data_speed, set_data_speed,
			data_start, set_data_start,
			data_easing, set_data_easing
		end

create
	default_create,
	make_with_content,
	make_with_raw_text

feature -- Output

	tag_name: STRING = "div"
			-- <Precursor>

;note
	design: "[
Tag    Description
<div>    Defines a division or a section in an HTML document
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_div.asp"

end
