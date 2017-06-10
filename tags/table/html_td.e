note
	description: "[
		Representation of an {HTML_TD}.
		]"

class
	HTML_TD

inherit
	HTML_TAG
		export {ANY}
			colspan, set_colspan,
			rowspan, set_rowspan,
			valign, set_valign
		end

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "td"
			-- <Precursor>

;note
	design: "[
Tag    Description
<td>    Defines a standard cell in an HTML table
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_td.asp"

end
