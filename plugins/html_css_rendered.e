note
	description: "[
		Representation of an effected {HTML_CSS_RENDERED}.
		]"
	design: "[
		An entity representing a package of items, such as:
		
		(1) One or more *.css files required for rendering.
		(2) One or more css <script> snippets to embed at the end of the </html> file.
		]"

class
	HTML_CSS_RENDERED

feature -- Access

	css_file_links: ARRAYED_LIST [HTML_LINK]
			-- A list of `css_files', which will appear as <link>s with href="*.css" and rel="stylesheet" and type="type/css" in the <head>.
		attribute
			create Result.make (10)
		end

	css_script_snippets: ARRAYED_LIST [HTML_SCRIPT]
			-- Hand-coded `cass_script_snippets', which will appear sa <script> items in the <head>.
		attribute
			create Result.make (10)
		end

;note
	design_intent: "[
		Your_text_goes_here
		]"

end
