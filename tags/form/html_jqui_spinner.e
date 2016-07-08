note
	description: "[
		Representation of an effected {HTML_JQUI_SPINNER}.
		]"

class
	HTML_JQUI_SPINNER

inherit
	HTML_INPUT
		rename
			documentation as html_documentation
		end

	HTML_HEAD_ITEM_GENERATOR
		undefine
			default_create,
			out
		end

	JQUI_SPINNER
		rename
			documentation as jqui_documentation
		undefine
			default_create,
			out
		end

create
	make_as_default,
	make_with_settings

feature {NONE} -- Initialization

	make_as_default (a_id: STRING; a_default_value: INTEGER)
			-- `make_as_default' for `a_id' controls with a simple `a_default_value'.
			-- Other settings on `spinner' are reasonably defaulted.
		do
			make_default (a_id, a_default_value, 0, 0, 0, 0)
			generated_script := defaulted_script
			default_create
		end

	make_with_settings (a_id: STRING; a_settings: attached like make_settings_anchor)
			-- `make_with_settings' for `a_id' controls with `a_settings' (see `spinner' and its `make_settings_anchor').
		do
			make_default (a_id, a_settings)
			generated_script := settings_script
			default_create
		end

	make_default (a_id: STRING; a_settings: attached like make_settings_anchor)
			-- Common `make' with `a_id' and `a_settings' (see `spinner' and its `make_settings_anchor').
		do
			set_type ("text")
			set_id (a_id)
			make (a_id, a_settings)
			css_file_links.force (create {HTML_LINK}.make_as_css_file_link ("jquery-ui.css"))
			javascript_file_scripts.force (create {HTML_SCRIPT}.make_with_javascript_file_name ("jquery.js"))
			javascript_file_scripts.force (create {HTML_SCRIPT}.make_with_javascript_file_name ("jquery-ui.js"))
		end

;note
	design_intent: "[
		Your_text_goes_here
		]"

end
