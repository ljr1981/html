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
		require
			has_js_ext: a_js_file_name.substring (a_js_file_name.count - 2, a_js_file_name.count).same_string (".js")
		do
			set_type ({HTTP_MIME_TYPES}.text_javascript)
			set_src (a_js_file_name)
		ensure
			type_set: attached {STRING} type.attr_value as al_value and then al_value.same_string ({HTTP_MIME_TYPES}.text_javascript)
		end

feature -- Output

	tag_name: STRING = "script"
			-- <Precursor>

	document_ready_script: STRING
			-- `document_ready_script' intended for placement in <head> tag.
		do
			set_content_wrapper_template (doc_ready_script_template)
			Result := html_out
		end

feature -- Constants

	doc_ready_script_template: STRING = "[
$("document").ready(function(){
	<<CONTENT>>
});
]"

invariant
	no_script: script_source.is_empty implies not attached script_source_content implies scripts.count = 0

;note
	design: "[
Tag    Description
<script>    Defines a client-side script
		]"
	EIS: "name=script", "src=http://www.w3schools.com/tags/tag_script.asp"

end
