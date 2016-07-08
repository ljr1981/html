note
	description: "[
		Abstract notion of an {HTML_TAG}.
		]"

deferred class
	HTML_TAG

inherit
	HTML_ANY
		undefine
			out
		redefine
			default_create
		end

	HTML_ATTRIBUTES
		export {ANY}
			href, set_href,
			rel, set_rel,
			role, set_role,
			src, set_source, set_src
		undefine
			default_create
		end

	HTML_CONSTANTS
		undefine
			default_create,
			out
		end

	HTML_FACTORY
		undefine
			default_create,
			out
		end

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			if not script_source.is_empty and then attached script_source_content as al_script_content then
				add_script (al_script_content)
			end
		end

	make_with_content (a_content: ARRAY [attached like content_anchor])
			-- `make_with_content' using `a_content' into `html_content_items'
		do
			across
				a_content as ic_content
			loop
				html_content_items.force (ic_content.item)
			end
			default_create
		end

	make_with_raw_text (a_text: STRING)
			-- `make_with_raw_text' of `a_text'.
			-- `a_text' goes <tag>here</tag>
		do
			set_text_content (a_text)
			default_create
		end

	make_with_src (a_source_text: STRING)
			-- `make_with_src' (i.e. source) using `a_string'.
		do
			set_attribute_value (agent src, a_source_text)
			default_create
		end

	make_restful_on_class (a_class, a_uri: STRING)
		do
			set_class_names (a_class)
			make_restful (a_uri)
		end

	make_restful (a_uri: like rest_uri)
			-- `make_restful' with `a_uri'.
		do
			set_rest_uri (a_uri)
		end

feature -- Style

	style_rule: CSS_RULE
			-- `style_rule'.
		attribute
			create Result
		end

	style_out: STRING
			-- `style_out' string representation of `style_rule'.
		do
			Result := style_rule.out
			across
				html_content_items as ic_items
			loop
				Result.append_string_general (ic_items.item.style_out)
			end
		end

feature -- HTML Content

	html_content_items: ARRAYED_LIST [attached like content_anchor]
			-- `html_content_items' for Current {HTML_TAG}
		attribute
			create Result.make (Default_capacity)
		end

	text_content: STRING
			-- `text_content' of Current {HTML_TAG}.
		attribute
			create Result.make_empty
		end

feature -- HTML Scripts

	scripts: ARRAYED_LIST [HTML_SCRIPT]
			-- `scripts' placed in Current {HTML_TAG}.
		note
			design: "[
				Such that:
				
				<tag> ... <script> ... </script></tag>
				
				This allows scripting to be placed right at the particular tag-level.
				]"
		attribute
			create Result.make (1)
		end

feature -- RESTful

	Rest_script: HTML_SCRIPT
			-- `Rest_script' is one of (future) many.
		note
			design: "[
				The serialaizeObject function is designed to serialize
				a DOM object and all its enclosed objects as key:value
				pairs (e.g. name:value where name and value are attributes
				on the <tag>).
				
				The second function is designed to take the output of
				serializeObject and form it up as JSON, sending it to
				the Server at the <<REST_URI>> message address to be
				processed by the Server.
				
				Finally, if there is redirection involved, then the
				uri of the redirection is inserted into the JS-code.
				]"
		require
			is_restful: is_restful
		local
			l_script_text: STRING
		do
			l_script_text := "[
$.fn.serializeObject = function() {
  var o = {};
  var a = this.serializeArray();
  $.each(a, function() {
    if (o[this.name] !== undefined) {
      if (!o[this.name].push) {
        o[this.name] = [o[this.name]];
      }
      o[this.name].push(this.value || '');
    } else {
      o[this.name] = this.value || '';
    }
  });
  return o;
};

$(function() {
  $('<<REFERENCE>>').submit(function() {
    var jsonData = JSON.stringify($('<<REFERENCE>>').serializeObject())
    $.ajax({
		url: '<<REST_URI>>',
		type: 'POST',
		contentType: 'application/json',
		data: (jsonData)
	});
	<<REDIRECTION>>
    return false;
  });
});
]"
--			check is_restful: is_restful then
				l_script_text.replace_substring_all ("<<REST_URI>>", rest_uri)
				check no_rest_uri_tag: not l_script_text.has_substring ("<<REST_URI>>") end

				if attached {STRING} global_class.attr_value as al_reference and then not al_reference.is_empty then
					l_script_text.replace_substring_all ("<<REFERENCE>>", "." + al_reference)
				elseif attached {STRING} global_id.attr_value as al_reference and then not al_reference.is_empty then
					l_script_text.replace_substring_all ("<<REFERENCE>>", "#" + al_reference)
				else
					l_script_text.replace_substring_all ("<<REFERENCE>>", tag_name)
				end
				check no_reference_tag: not l_script_text.has_substring ("<<REFERENCE>>") end

				if is_redirection_needed then
					l_script_text.replace_substring_all ("<<REDIRECTION>>", "window.location.assign(%"" + redirection_uri + "%")")
				else
					l_script_text.replace_substring_all ("<<REDIRECTION>>", "")
				end
				check no_redirection_tag: not l_script_text.has_substring ("<<REDIRECTION>>") end
--			end
			create Result.make_with_javascript (l_script_text)
			Result.set_type ("text/javascript")
		end

	is_redirection_needed: BOOLEAN
			-- When `is_restful' is complete, `is_redirection_needed'?
			-- Example: User pressed "Submit" --> Thank you page?

	set_needs_redirection
			-- `set_needs_redirection' make `is_redirection_needed' = True.
		do
			is_redirection_needed := True
		ensure
			set: is_redirection_needed
		end

	redirection_uri: STRING
			-- `redirection_uri' if `is_redirection_needed'.
		attribute
			create Result.make_empty
		end

	set_redirection_uri (a_uri: like redirection_uri)
			-- `set_redirection_uri' to `a_uri'.
		do
			redirection_uri := a_uri
		ensure
			set: redirection_uri.same_string (a_uri)
		end

	is_restful: BOOLEAN
			-- `is_restful' (e.g. is this <tag> involved in RESTful actions)?

	rest_uri: STRING
			-- `rest_uri'--if `is_restful', then what `rest_uri' are we using?
		attribute
			create Result.make_empty
		end

	set_rest_uri (a_uri: like rest_uri)
			-- `set_rest_uri' with `a_uri' into `rest_uri'.
			-- Ensure that `is_restful' is True and `add_script'.
		require
			not_empty_but_is_empty: not a_uri.is_empty
				-- Setting an empty URI is not acceptible for RESTful server request.
				-- There must be a server URI for the RESTful call.
		do
			rest_uri := a_uri
			is_restful := True
			add_script (Rest_script)
		ensure
			is_restful_but_not: is_restful
					-- Promises that Current `is_restful' (prepped for RESTful calls).
			set: rest_uri.same_string (a_uri)
					-- Promises that passed `a_uri' was actually set into `rest_uri'.
		end

feature -- Setting: Content

	add_to_current,
	add_content (a_item: attached like content_anchor)
			-- `add_content' `a_item' to `html_content_items'
		note
			EIS: "name=VNHO", "src=https://github.com/ljr1981/moonshot/blob/master/README.md"
		require
			not_has_but_has_object_as_reference: not html_content_items_has (a_item)
				-- You cannot add an object reference to `html_content_items' more than once.
				-- See EIS: VNHO
		do
			html_content_items.force (a_item)
		end

	html_content_items_has (a_item: attached like content_anchor): BOOLEAN
			-- `html_content_items_has' `a_item'?
			-- Check if the content has `a_item', True if it does.
		do
			Result := html_content_items.has (a_item)
		end

	add_contents (a_items: ARRAY [attached like content_anchor])
			-- `add_contents' of `a_items' to `html_content_items'.
		do
			across
				a_items as ic
			loop
				add_content (ic.item)
			end
		ensure
			expected_all_added_but_somethings_missing:
					across a_items as ic all
						across html_content_items as ic_content some
							ic_content.item ~ ic.item
						end
					end
				-- Promises that each ic.item in `a_items' list was added to the
				--	`html_content_items', which is the goal of this feature.
		end

feature -- Setting: Scripts

	add_script (a_script: HTML_SCRIPT)
			-- `add_script' `a_script' to `scripts'.
		do
			scripts.force (a_script)
		ensure
			has_but_missing_script: scripts.has (a_script)
				-- Promises that `scripts' will have `a_script' when finished.
		end

	add_scripts (a_scripts: ARRAY [HTML_SCRIPT])
			-- `add_scripts' in `a_scripts' to `scripts'.
		do
			across
				a_scripts as ic
			loop
				scripts.force (ic.item)
			end
		ensure
			has_all_but_missing_something: scripts.count = old scripts.count + a_scripts.count
				-- Promises that `scripts' will have all `a_scripts' loaded when finished.
		end

	set_external_css_file_name (a_external_css_file_name: like external_css_file_name)
			-- `set_external_css_file_name' with `a_external_css_file_name'
		do
			external_css_file_name := a_external_css_file_name
		ensure
			set: external_css_file_name ~ a_external_css_file_name
		end

feature -- Setting: Text Content

	set_text_content (a_text: like text_content)
			-- `set_text_content' with `a_text'.
		do
			text_content := a_text
		ensure
			set_but_different: text_content.same_string (a_text)
				-- Promises `text_content' will be precisely `same_string' as `a_text'.
		end

feature -- Nested Creators

	add_text_content (a_text: STRING)
			-- `add_text_content' as {HTML_TEXT} to `html_content_items'.
		do
			html_content_items.force (create {HTML_TEXT}.make_with_text (a_text))
		end

	add_code_tag_content (a_text: STRING)
		do
			html_content_items.force (create {HTML_CODE}.make_with_content (<<create {HTML_TEXT}.make_with_text (a_text)>>))
		end

	add_a_tag_content_link_and_text (a_link, a_text: STRING)
		do
			html_content_items.force (create {HTML_A}.make_with_link_and_text (a_link, a_text))
		end

feature -- Output

	innerHTML_out,
	html_out: STRING
			-- `html_out' of Current {HTML_TAG}.
		do
			Result := common_out (not_pretty)
		end

	innerHTML_pretty_out,
	pretty_out: STRING
			-- `pretty_out' of Current {HTML_TAG}.
		do
			Result := common_out (prettified)
		end

	tag_name: STRING
			-- `tag_name' for `html_out' of Current {HTML_TAG}.
		deferred
		ensure
			valid_tag: across valid_tags as ic some ic.item.same_string (Result) end
		end

	add_head_items (a_javascript_files: HASH_TABLE [HTML_SCRIPT, INTEGER]; a_css_files: HASH_TABLE [HTML_LINK, INTEGER]; a_scripts: HASH_TABLE [HTML_SCRIPT, INTEGER])
		local
			l_script: HTML_SCRIPT
		do
			if attached {HTML_HEAD_ITEM_GENERATOR} Current as al_current then
				across
					al_current.javascript_file_scripts as ic_scripts
				loop
					a_javascript_files.force (ic_scripts.item, ic_scripts.item.html_out.hash_code)
				end
				across
					al_current.css_file_links as ic_links
				loop
					a_css_files.force (ic_links.item, ic_links.item.html_out.hash_code)
				end
				create l_script
				l_script.set_type ("text/javascript")
				l_script.set_text_content (al_current.generated_script)
				a_scripts.force (l_script, l_script.html_out.hash_code)
			end
			across
				html_content_items as ic_content_items
			loop
				ic_content_items.item.add_head_items (a_javascript_files, a_css_files, a_scripts)
			end
		end

	content_wrapper_template: like content_wrapper_template_type_anchor
			-- A `content_wrapper_template', which optionally wraps <<CONTENT>> in `common_out'
			--	between the `Start_tag' and `End_tag' items.

	set_content_wrapper_template (a_content_wrapper_template: attached like content_wrapper_template)
			-- `set_content_wrapper_template' with `a_content_wrapper_template'
		do
			content_wrapper_template := a_content_wrapper_template
		ensure
			set: content_wrapper_template ~ a_content_wrapper_template
		end

feature {NONE} -- Implementation: Output

	Not_pretty: BOOLEAN = False
	Prettified: BOOLEAN = True

	common_out (a_prettified: like Prettified): STRING
			-- `common_out' of `a_prettified' (True/False).
		local
			l_content,
			l_template: STRING
		do
			create Result.make_empty

				-- Start tag ...
			Result.append_string (start_tag)
			if a_prettified then Result.append_character ('%N'); Result.append_character ('%T') end

				-- Tag attributes ...
			if attached attributes_out as al_attributes_out and then not al_attributes_out.is_empty then
				Result.replace_substring_all (tag_attributes_tag, " " + al_attributes_out)
			else
				Result.replace_substring_all (tag_attributes_tag, create {STRING}.make_empty)
			end
			if a_prettified then Result.append_character ('%N'); Result.append_character ('%T') end

				-- Nested items ...
			l_content := content_only_html_out (a_prettified)

			if attached content_wrapper_template as al_template then
				l_template := al_template.twin
				l_template.replace_substring_all ("<<CONTENT>>", l_content)
				Result.append_string_general (l_template)
			else
				Result.append_string_general (l_content)
			end

				-- End tag ...
			Result.append_string (end_tag)
			if a_prettified then Result.append_character ('%N'); Result.append_character ('%T') end
		end

	content_only_html_out (a_prettified: like Prettified): STRING
			-- The `content_only_html_out', which is the "stuff" between the `Start_tag' and `End_tag'
		do
			create Result.make_empty
			across
				html_content_items as ic_content_list
			loop

				if a_prettified then
					Result.append_string (ic_content_list.item.pretty_out)
					Result.append_character ('%N')
					Result.append_character ('%T')
				else
					Result.append_string (ic_content_list.item.html_out)
				end
			end

				-- Nested `text_content'
			Result.append_string (text_content)
			if a_prettified then Result.append_character ('%N'); Result.append_character ('%T') end

				-- Nested `scripts'
			across
				scripts as ic_scripts
			loop
				if a_prettified then
					Result.append_string (ic_scripts.item.pretty_out)
					Result.append_character ('%N')
					Result.append_character ('%T')
				else
					Result.append_string (ic_scripts.item.html_out)
				end
			end
		end

	content_wrapper_template_type_anchor: detachable STRING
			-- `content_wrapper_template_type_anchor' for `content_wrapper_template' and `set_content_wrapper_template'.

feature {NONE} -- Implementation: JavaScript

	script_source_content: detachable HTML_SCRIPT
			-- Optional `script_source_content' from `script_source'.
		do
			if not script_source.is_empty then
				create Result.make_with_javascript (script_source)
			end
		ensure
			non_void_result_but_empty: attached Result implies not script_source.is_empty
				-- Promises that a non-Void Result will not have an empty `script_source'.
				-- A non-empty `script_source' implies a non-Void Result as JavaScript.
		end

	script_source: STRING
			-- Optional `script_source' like JavaScript.
		attribute
			create Result.make_empty
		end

feature -- External CSS

	external_css_files: ARRAYED_LIST [attached like external_css]
			-- `external_css_files' from `external_css' and `html_content_items'.
			-- Builds HTML_LINK items into a Result list for this and all contained
			--	HTML elements.
		do
			create Result.make (1)
			if attached external_css as al_link then
				Result.force (al_link)
			end
			across
				html_content_items as ic_content
			loop
				Result.append (ic_content.item.external_css_files)
			end
		ensure
			external_css_content_but_empty: attached external_css implies not Result.is_empty
				-- Promises that having an `external_css' reference means at least 1 link in Result.
				-- More items in the Result means subordinate HTML elements also have `external_css_files'.
		end

feature {TEST_SET_BRIDGE} -- Implementation: Ext CSS

	external_css: detachable HTML_LINK
			-- `external_css' as {HTML_LINK} based on qualified `external_css_file_name'.
		do
			if not external_css_file_name.is_empty then
				create Result
				Result.set_rel (Stylesheet_kw)
				Result.set_href (external_css_file_name)
			end
		ensure
			file_name_means_result_but_void: (not external_css_file_name.is_empty) implies attached Result
				-- Promises that if `external_css_file_name' has content (not empty), then
				--	a non-Void (attached) {HTML_LINK} is the Result.

			rel_set_but_not: attached Result implies
								attached {STRING} Result.rel.attr_value as al_value and then
								al_value.same_string (Stylesheet_kw)
				-- Promises that an attached Result has `Stylesheet_kw' as its rel.

			href_set_but_not: attached Result implies
								attached {STRING} Result.href.attr_value as al_value and then
								al_value.same_string (external_css_file_name)
				-- Promises that an attached Result has `external_css_file_name' set to href attribute name.
		end

	external_css_file_name: STRING attribute create Result.make_empty end
			-- `external_css_file_name' (if any). Empty if not.

feature -- External JS

	external_js_files: ARRAYED_LIST [attached like external_js]
			-- `external_js_files' from `external_js' and `html_content_items'.
		do
			create Result.make (1)
			if attached external_js as al_link then
				Result.force (al_link)
			end
			across
				html_content_items as ic_content
			loop
				Result.append (ic_content.item.external_js_files)
			end
		end

feature {NONE} -- Implementation: Ext JS

	external_js: detachable HTML_SCRIPT
			-- `external_js' based on qualified `external_js_file_name'.
		do
			if not external_js_file_name.is_empty then
				create Result
				Result.set_source (external_js_file_name)
			end
		end

	external_js_file_name: STRING attribute create Result.make_empty end
			-- `external_js_file_name' (if any). Empty if not.

feature {NONE} -- Implementation: Constants

	content_anchor: detachable HTML_TAG
			-- `content_anchor' for Current {HTML_TAG}.

	start_tag: STRING
		once ("object")
			if not tag_name.is_empty then
				Result := "<" + tag_name + tag_attributes_tag + ">"
			else
				Result := ""
			end
		end

	end_tag: STRING
		once ("object")
			if not tag_name.is_empty then
				Result := "</" + tag_name + ">"
			else
				Result := ""
			end
		end

	tag_attributes_tag: STRING = "<<TAG_ATTRIBUTES>>"

end
