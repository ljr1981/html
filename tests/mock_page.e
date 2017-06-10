note
	description: "Summary description for {MOCK_PAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MOCK_PAGE

inherit
	HTML_PAGE

feature {NONE} -- Initialization

	initialize_widget (a_widget: HTML_DIV)
		do

		end

feature {NONE} -- Initialization Support

	manually_specified_css_files: ARRAY [STRING]
			-- A list of `manually_specified_css_files'
		attribute
			Result := <<>>
		end

	manually_specified_javascript_files: ARRAY [STRING]
			-- A list of `manually_specified_javascript_files'
		attribute
			Result := <<>>
		end

end
