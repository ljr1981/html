note
	description: "[
		Representation of an {HTML_LEGEND}.
		]"

class
	HTML_LEGEND

inherit
	HTML_TAG

	HTML_FORM_COMPONENT
		undefine
			default_create,
			out
		end

feature -- Output

	tag_name: STRING = "legend"
			-- <Precursor>

;note
	design: "[
Tag    Description
<form>    used to create an HTML legend for forms
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_legend.asp"

end
