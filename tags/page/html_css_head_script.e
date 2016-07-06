note
	description: "[
		Representation of an effected {HTML_CSS_HEAD_SCRIPT}.
		]"
	semantic: "[
		Instances of this class are designed to render <head> CSS <script>s.
		]"

class
	HTML_CSS_HEAD_SCRIPT

inherit
	HTML_SCRIPT
		rename
			make_with_javascript as make_with_raw_css
		redefine
			make_with_raw_css
		end

create
	make_with_raw_css

feature {NONE} -- Initialization

	make_with_raw_css (a_raw_css_text: STRING)
			-- <Precursor>
		do
			Precursor (a_raw_css_text)
			set_type ({HTTP_MIME_TYPES}.text_css)
		end

note
	design_intent: "[
		]"

end
