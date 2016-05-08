note
	description: "[
		Representation of an {HTML_SCRIPT}.
		]"

class
	HTML_SCRIPT

inherit
	HTML_TAG
		rename
			make_with_raw_text as make_with_javascript
		export {ANY}
			src
		end

create
	default_create,
	make_with_content,
	make_with_src,
	make_with_javascript

feature {NONE} -- Initialization

	make_with_src (a_source_text: STRING)
			-- `make_with_src' (i.e. source) using `a_string'.
		do
			set_attribute_value (agent src, a_source_text)
		end

feature -- Output

	tag_name: STRING = "script"
			-- <Precursor>

;note
	design: "[
Tag    Description
<script>    Defines a client-side script
		]"
	EIS: "name=script", "src=http://www.w3schools.com/tags/tag_script.asp"

end
