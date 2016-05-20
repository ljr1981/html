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
			src, set_src,
			type, set_type
		end

create
	default_create,
	make_with_content,
	make_with_src,
	make_with_javascript,
	make_with_javascript_file_name

feature {NONE} -- Initialization

	make_with_javascript_file_name (a_js_file_name: STRING)
			-- `make_with_javascript_file_name' with `a_js_file_name'.
		do
			set_type ("text/javascript")
			set_src (a_js_file_name)
		end

feature -- Output

	tag_name: STRING = "script"
			-- <Precursor>

invariant
	no_script: script_source.is_empty implies not attached script_source_content implies scripts.count = 0

;note
	design: "[
Tag    Description
<script>    Defines a client-side script
		]"
	EIS: "name=script", "src=http://www.w3schools.com/tags/tag_script.asp"

end
