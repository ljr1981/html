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
			src, set_source, set_src,
			rel, set_rel
		undefine
			default_create
		end

	HTML_CONSTANTS
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

				]"
		attribute
			create Result.make (1)
		end

feature -- Setting: Content

	add_content (a_item: attached like content_anchor)
			-- `add_content' `a_item' to `html_content_items'
		do
			html_content_items.force (a_item)
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
			added: across a_items as ic all
						across html_content_items as ic_content some
							ic_content.item ~ ic.item
						end
					end
		end

feature -- Setting: Scripts

	add_script (a_script: HTML_SCRIPT)
			-- `add_script' `a_script' to `scripts'.
		do
			scripts.force (a_script)
		ensure
			has: scripts.has (a_script)
		end

	add_scripts (a_scripts: ARRAY [HTML_SCRIPT])
			-- `add_scripts' in `a_scripts' to `scripts'.
		do
			across
				a_scripts as ic
			loop
				scripts.force (ic.item)
			end
		end

feature -- Setting: Text Content

	set_text_content (a_text: like text_content)
			-- `set_text_content' with `a_text'.
		do
			text_content := a_text
		ensure
			set: text_content.same_string (a_text)
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

	html_out: STRING
			-- `html_out' of Current {HTML_TAG}.
		do
			Result := common_out (not_pretty)
		end

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

feature {NONE} -- Implementation: Output

	not_pretty: BOOLEAN = False
	prettified: BOOLEAN = True

	common_out (a_prettified: BOOLEAN): STRING
			-- `common_out' of `a_prettified' (True/False).
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

				-- End tag ...
			Result.append_string (end_tag)
			if a_prettified then Result.append_character ('%N'); Result.append_character ('%T') end
		end

feature {NONE} -- Implementation: JavaScript

	script_source_content: detachable HTML_SCRIPT
			-- Optional `script_source_content' from `script_source'.
		do
			if not script_source.is_empty then
				create Result.make_with_javascript (script_source)
			end
		end

	script_source: STRING
			-- Optional `script_source' like JavaScript.
		attribute
			create Result.make_empty
		end

feature -- External CSS

	external_css_files: ARRAYED_LIST [attached like external_css]
			-- `external_css_files' from `external_css' and `html_content_items'.
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
		end

feature {NONE} -- Implementation: Ext CSS

	external_css: detachable HTML_LINK
			-- `external_css' based on qualified `external_css_file_name'.
		do
			if not external_css_file_name.is_empty then
				create Result
				Result.set_rel ("stylesheet")
				Result.set_href (external_css_file_name)
			end
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
