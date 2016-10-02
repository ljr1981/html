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
			src, set_source, set_src,
			style, set_style
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

	HTML_HEAD_ITEM_GENERATOR
		undefine
			default_create,
			out
		end

	LE_LOGGING_AWARE
		undefine
			default_create,
			out
		end

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			Precursor
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

	body_scripts: ARRAYED_LIST [HTML_SCRIPT]
			-- HTML <script> `body_scripts' to be applied to <body> ... </body>
		attribute
			create Result.make (Default_capacity)
		end

	text_content: STRING
			-- `text_content' of Current {HTML_TAG}.
		attribute
			create Result.make_empty
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
			--logger.write_information ("{" + Current.generating_type.out + "}" + ".add_content")
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
			l_script_text: STRING
		do
			logger.write_information ("{" + Current.generating_type.out + "}" + ".add_head_items")
			across
				javascript_file_scripts as ic_scripts
			loop
				logger.write_information (ic_scripts.item.html_out)
				a_javascript_files.force (ic_scripts.item, ic_scripts.item.html_out.hash_code)
			end
			across
				css_file_links as ic_links
			loop
				logger.write_information (ic_links.item.html_out)
				a_css_files.force (ic_links.item, ic_links.item.html_out.hash_code)
			end
			create l_script_text.make_empty
			if not generated_script.is_empty then
				logger.write_information (generated_script)
				l_script_text.append_string_general (generated_script)
			end
			if not custom_hand_coded_script.is_empty then
				logger.write_information (custom_hand_coded_script)
				l_script_text.append_string_general (custom_hand_coded_script)
			end
			if not l_script_text.is_empty then
				logger.write_information (l_script_text)
				create l_script
				l_script.set_type ("text/javascript")
				l_script.set_text_content (l_script_text)
				a_scripts.force (l_script, l_script.html_out.hash_code)
			end
			across
				html_content_items as ic_content_items
			loop
				logger.write_information ("COUNTS: JS=" + a_javascript_files.count.out + ", CSS=" + a_css_files.count.out + ", SCRIPTS=" + a_scripts.count.out)
				ic_content_items.item.add_head_items (a_javascript_files, a_css_files, a_scripts)
			end
		end

	add_body_scripts (a_body_scripts: ARRAYED_LIST [HTML_SCRIPT])
			--
		do
			if not body_scripts.is_empty then
				a_body_scripts.append (body_scripts)
			end
			across
				html_content_items as ic
			loop
				ic.item.add_body_scripts (a_body_scripts)
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
		end

	content_wrapper_template_type_anchor: detachable STRING
			-- `content_wrapper_template_type_anchor' for `content_wrapper_template' and `set_content_wrapper_template'.

feature {NONE} -- Implementation: Constants

	content_anchor: detachable HTML_TAG
			-- `content_anchor' for Current {HTML_TAG}.

	start_tag: STRING
		do
			if not tag_name.is_empty then
				Result := "<" + tag_name + tag_attributes_tag + ">"
			else
				Result := ""
			end
		end

	end_tag: STRING
		do
			if not tag_name.is_empty then
				Result := "</" + tag_name + ">"
			else
				Result := ""
			end
		end

	tag_attributes_tag: STRING = "<<TAG_ATTRIBUTES>>"

end
