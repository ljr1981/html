class
	HTML_PAGE_GENERIC

inherit
	HTML_PAGE

create
	default_create

feature {NONE} -- Initialization

	initialize_widget (a_widget: HTML_DIV)
			-- `initialize_widget' `a_widget'.
		do

		end

feature {NONE} -- Initialization Support

	manually_specified_css_files: ARRAY [STRING]
			-- A list of `manually_specified_css_files'
		attribute
			create Result.make_empty
		end

	manually_specified_javascript_files: ARRAY [STRING]
			-- A list of `manually_specified_javascript_files'
		attribute
			create Result.make_empty
		end

end
