note
	description: "[
		Representation of an {HTML_MENU}.
		]"

class
	HTML_MENU

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_MENU}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "menu"
			-- <Precursor>

;note
	design: "[
		The <menu> tag defines a list/menu of commands.

		The <menu> tag is used for context menus, toolbars
		and for listing form controls and commands.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_menu.asp"

end
