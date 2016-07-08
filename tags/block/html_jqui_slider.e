note
	description: "[
		Representation of an effected {HTML_JQUI_SLIDER}.
		]"

class
	HTML_JQUI_SLIDER

inherit
	HTML_DIV
		rename
			documentation as html_documentation
		end

	HTML_HEAD_ITEM_GENERATOR
		undefine
			default_create,
			out
		end

	JQUI_SLIDER
		rename
			documentation as jqui_documentation
		undefine
			default_create,
			out
		end

create
	make_with_settings

feature {NONE} -- Initialization

	make_with_settings (a_id: STRING; a_settings: attached like make_settings_anchor)
			-- `make_with_settings'.
		do
			create generated_script.make_empty
		end

end
