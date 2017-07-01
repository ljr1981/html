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
			crossorigin, set_crossorigin,
			data_auto_init, set_data_auto_init,
			src, set_src,
			type, set_type
		end

create
	default_create,
	make_with_content,
	make_with_src,
	make_with_javascript,
	make_with_javascript_file_name,
	make_with_type_src,
	make_with_type_and_code_text

feature {NONE} -- Initialization

	make_with_type_src (a_type, a_src: STRING)
		do
			set_type (a_type)
			set_src (a_src)
		end

	make_with_type_and_code_text (a_type, a_code: STRING)
		do
			set_type (a_type)
			add_text_content (a_code)
		end

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

feature -- Setters

	set_as_type_and_code_text (a_type, a_code: STRING): HTML_SCRIPT
		do
			set_type (a_type)
			add_text_content (a_code)
			Result := Current
		end

	set_as_type_src (a_type, a_src: STRING): HTML_SCRIPT
		do
			set_type (a_type)
			set_src (a_src)
			Result := Current
		end

	set_as_javascript_file (a_js_file_name: STRING)
		require
			has_js_ext: a_js_file_name.substring (a_js_file_name.count - 2, a_js_file_name.count).same_string (".js")
		do
			set_type ({HTTP_MIME_TYPES}.text_javascript)
			set_src (a_js_file_name)
		ensure
			type_set: attached {STRING} type.attr_value as al_value and then al_value.same_string ({HTTP_MIME_TYPES}.text_javascript)
		end

	set_as_cdn_javascript (a_src, a_integrity, a_crossorigin: STRING)
		do
			set_src (a_src)
			set_attribute_manual ("integrity", a_integrity, True)
			set_crossorigin (a_crossorigin)
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

;note
	design: "[
Tag    Description
<script>    Defines a client-side script
		]"
	EIS: "name=script", "src=http://www.w3schools.com/tags/tag_script.asp"

end
