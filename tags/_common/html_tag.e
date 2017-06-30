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
			contenteditable, set_contenteditable,
			href, set_href,
			on_click, set_on_click,
			on_focus, set_on_focus,
			rel, set_rel,
			role, set_role,
			src, set_source, set_src,
			style, set_style
		undefine
			default_create
		redefine
			attributes_out
		end

	HTML
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
			-- `make_with_content' using `a_content' into `contents'
		do
			default_create
			across
				a_content as ic_content
			loop
				contents.force (ic_content.item)
			end
		end

	make_with_raw_text (a_text: STRING)
			-- `make_with_raw_text' of `a_text'.
			-- `a_text' goes <tag>here</tag>
		do
			default_create
			set_text_content (a_text)
		end

	make_with_src (a_source_text: STRING)
			-- `make_with_src' (i.e. source) using `a_string'.
		do
			default_create
			set_attribute_value (agent src, a_source_text)
		end

feature -- Style

	add_style (a_property, a_value: STRING; a_is_quoted, a_is_inline: BOOLEAN; a_external_name, a_selectors: detachable STRING)
		require
			inline_mutex: (a_is_inline and then not attached a_external_name) xor
							( (attached a_external_name and then not a_is_inline) or
								(not attached a_external_name and then not a_is_inline) )
			has_selectors: not attached a_selectors implies
							attached {STRING} global_class.attr_value
		local
			l_decl: CSS_DECLARATION
			l_hashable_string: STRING
		do
			if a_is_quoted then
				create l_decl.make_quoted_value (a_property, a_value)
			else
				create l_decl.make_unquoted_value (a_property, a_value)
			end
			if attached classes_as_selectors (a_selectors) as al_selectors then
				l_hashable_string := al_selectors.twin
				l_hashable_string.append_string_general (l_decl.out)
				styles.force ([l_decl, a_is_inline, a_external_name, al_selectors], l_hashable_string.hash_code)
			elseif attached {STRING} global_class.attr_value as al_value and then
					attached {STRING} classes_as_selectors (al_value) as al_selectors
				then
					l_hashable_string := al_selectors.twin
					l_hashable_string.append_string_general (l_decl.out)
					styles.force ([l_decl, a_is_inline, a_external_name, al_selectors], l_hashable_string.hash_code)
			else
				check must_declare_selectors: False end
			end
		end

	classes_as_selectors (a_classes: detachable STRING): detachable STRING
		do
			if attached {STRING} a_classes as al_classes then
				Result := al_classes.twin
				if not Result.is_empty then
					Result.prepend_character ('.')
					Result.replace_substring_all (" ", " .")
				end
			end
		end

	styles: HASH_TABLE [attached like styles_item_anchor, INTEGER]
		attribute
			create Result.make (5)
		end

	styles_item_anchor: detachable TUPLE [declaration: CSS_DECLARATION; is_inline: BOOLEAN; external_name: detachable STRING; selectors: STRING]

	all_styles: like styles
			-- `all_styles' for Current including those in `contents'.
		do
			create Result.make (50)
			gather_all_styles_into (Result)
		end

	gather_all_styles_into (a_all_styles: like styles)
		do
			across
				styles as ic_local_styles
			loop
				a_all_styles.force (ic_local_styles.item, ic_local_styles.item.declaration.out.hash_code)
			end

			across
				contents as ic_html_content
			loop
				ic_html_content.item.gather_all_styles_into (a_all_styles)
			end
		end

	attached_all_styles: like all_styles
			-- Post `set_all_styles_cache', which loads `all_styles_cache' from `all_styles'
			-- so this feature returns whatever is in the cache and expects it to be attached.
		do
			check has_all_styles_cached: attached all_styles_cache as al_cache then
				Result := al_cache
			end
		end

	all_styles_cache: detachable like styles
			-- Currents cache of `all_styles'.

	set_all_styles_cache
			-- `set_all_styles_cache' loads `all_styles_cache' with `all_styles'
		do
			all_styles_cache := all_styles
		end

	css_inline_out: STRING
			-- `css_inline_out' outputs online `styles' which are "inline".
		do
			create Result.make_empty
			across
				styles as ic_local_styles
			loop
				if ic_local_styles.item.is_inline then
					Result.append_string_general (ic_local_styles.item.declaration.out)
				end
			end
		end

	css_internal_out: STRING
			-- Current's `css_internal_out' for all internal-CSS, and children of Current.
		local
			l_rule_hash: attached like rule_hash_anchor
		do
				-- Build `l_rule_hash' as a hash of like-selectors, with unique declarations.
			set_all_styles_cache
			create l_rule_hash.make (attached_all_styles.count)
			across
				attached_all_styles as ic
			loop
				if not ic.item.is_inline and then not attached ic.item.external_name then
					add_rule_hash_item (l_rule_hash, ic.item)
				end
			end
				-- Create result from `l_rule_hash'.
			Result := css_rule_hash_out (l_rule_hash)
		end

	css_external_out: STRING
			-- Current's `css_external_out' for all external-CSS, and children of Current.
		local
			l_rule_hash: attached like rule_hash_anchor
		do
				-- Build `l_rule_hash' as a hash of like-selectors, with unique declarations.
			set_all_styles_cache
			create l_rule_hash.make (attached_all_styles.count)
			across
				attached_all_styles as ic
			loop
				if not ic.item.is_inline and then attached ic.item.external_name then
					add_rule_hash_item (l_rule_hash, ic.item)
				end
			end
				-- Create result from `l_rule_hash'.
			Result := css_rule_hash_out (l_rule_hash)
		end

	add_rule_hash_item (a_rule_hash: attached like rule_hash_anchor; a_style_item: attached like styles_item_anchor)
			-- From `a_style_item' `add_rule_hash_item' to `a_rule_hash'.
		local
			l_declarations: HASH_TABLE [CSS_DECLARATION, INTEGER]
		do
			if attached a_rule_hash.at (a_style_item.selectors) as al_rule then
				al_rule.declarations.force (a_style_item.declaration, a_style_item.declaration.out.hash_code)
			else
				create l_declarations.make (5)
				l_declarations.force (a_style_item.declaration, a_style_item.declaration.out.hash_code)
				a_rule_hash.force ([a_style_item.selectors, l_declarations], a_style_item.selectors)
			end
		end

	css_rule_hash_out (a_rule_hash: attached like rule_hash_anchor): STRING
			-- From `a_rule_hash' make `css_rule_hash_out' to {STRING} Result.
		do
			create Result.make_empty
			across
				a_rule_hash as ic_rule
			loop
				Result.append_string_general (ic_rule.item.selectors)
				Result.append_character (' ')
				Result.append_character ('{')
				across
					ic_rule.item.declarations as ic_declarations
				loop
					Result.append_string_general (ic_declarations.item.out)
				end
				Result.append_character ('}')
			end
		end

	rule_hash_anchor: detachable HASH_TABLE [TUPLE [selectors: STRING; declarations: HASH_TABLE [CSS_DECLARATION, INTEGER]], STRING]
			-- Current's `rule_hash_anchor'.

feature -- HTML Content

	contents: ARRAYED_LIST [attached like content_anchor]
			-- `contents' for Current {HTML_TAG}
		attribute
			create Result.make (Default_capacity)
		end

	text_content: STRING
			-- `text_content' of Current {HTML_TAG}.
		attribute
			create Result.make_empty
		end

feature -- Setting: Attributes

	set_contenteditable_true
		do
			set_contenteditable ("true")
		end

	set_select_all_on_focus
		do
			set_on_focus ("document.execCommand('selectAll', false, null);")
		end

	set_contenteditable_and_select_all_on_focus
		do
			set_contenteditable_true
			set_select_all_on_focus
		end

feature -- Setting: Content

	extend,
	add_content (a_item: attached like content_anchor)
			-- `add_content' `a_item' to `contents'
		note
			EIS: "name=VNHO", "src=https://github.com/ljr1981/moonshot/blob/master/README.md"
		require
			not_has_but_has_object_as_reference: not html_content_items_has (a_item)
				-- You cannot add an object reference to `contents' more than once.
				-- See EIS: VNHO
		do
			--logger.write_information ("{" + Current.generating_type.out + "}" + ".add_content")
			contents.force (a_item)
		end

	add_contents (a_items: ARRAY [attached like content_anchor])
			-- `add_contents' of `a_items' to `contents'.
		do
			across
				a_items as ic
			loop
				extend (ic.item)
			end
		ensure
			expected_all_added_but_somethings_missing:
					across a_items as ic all
						across contents as ic_content some
							ic_content.item ~ ic.item
						end
					end
				-- Promises that each ic.item in `a_items' list was added to the
				--	`contents', which is the goal of this feature.
		end

	set_text_content (a_text: like text_content)
			-- `set_text_content' with `a_text'.
		do
			text_content := a_text
		ensure
			set_but_different: text_content.same_string (a_text)
				-- Promises `text_content' will be precisely `same_string' as `a_text'.
		end

	add_text_content (a_text: STRING)
			-- `add_text_content' as {HTML_TEXT} to `contents'.
		do
			contents.force (create {HTML_TEXT}.make_with_text (a_text))
		end

feature -- Queries: Contents

	html_content_items_has (a_item: attached like content_anchor): BOOLEAN
			-- `html_content_items_has' `a_item'?
			-- Check if the content has `a_item', True if it does.
		do
			Result := contents.has (a_item)
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

	hash_code: INTEGER_32
			-- hash_code of html_out.
		do
			Result := html_out.hash_code
		end

feature -- Adders: <head>

	add_meta_head_item (a_item: HTML_META)
		do
			head_meta_items_internal.force (a_item, a_item.html_out.hash_code)
		end

	add_link_head_item (a_item: HTML_LINK)
		do
			head_link_items_internal.force (a_item, a_item.html_out.hash_code)
		end

	add_script_head_item (a_item: HTML_SCRIPT)
		do
			head_script_items_internal.force (a_item, a_item.html_out.hash_code)
		end

	add_style_head_item (a_item: HTML_STYLE)
		do
			head_style_items_internal.force (a_item, a_item.html_out.hash_code)
		end

feature -- Adders: <body>

	add_link_body_item (a_item: HTML_LINK)
		do
			body_link_items_internal.force (a_item, a_item.html_out.hash_code)
		end

	add_script_body_item (a_item: HTML_SCRIPT)
		do
			body_script_items_internal.force (a_item, a_item.html_out.hash_code)
		end

	add_style_body_item (a_item: HTML_STYLE)
		do
			body_style_items_internal.force (a_item, a_item.html_out.hash_code)
		end

feature -- Gathering Functions: <head>

	-- <title>
	-- <head><meta>
	head_meta_items: like head_meta_items_temp
		do
			Result := head_meta_items_temp
		end

	head_meta_items_refresh
			-- Refresh of `head_meta_items_internal' from `head_meta_items_get'.
		do
			head_meta_items_temp.wipe_out
			across head_meta_items_internal as ic loop head_meta_items_temp.force (ic.item, ic.key) end
			head_meta_items_get (head_meta_items_temp)
		end

	head_meta_items_get (a_list: like head_meta_items_internal)
			-- Gather local `head_meta_items_internal' into `a_list'
			-- Recursively gather `head_meta_items_internal' from `contents' into `a_list'
		do
			across
				head_meta_items_internal as ic
			loop
				a_list.force (ic.item, ic.item.hash_code)
			end
			across
				contents as ic
			loop
				ic.item.head_meta_items_get (a_list)
			end
		end

	-- <head><link>
	head_link_items: like head_link_items_temp
		do
			Result := head_link_items_temp
		end

	head_link_items_refresh
			-- Refresh of `head_link_items_internal' from `head_link_items_get'.
		do
			head_link_items_temp.wipe_out
			across head_link_items_internal as ic loop head_link_items_temp.force (ic.item, ic.key) end
			head_link_items_get (head_link_items_temp)
		end

	head_link_items_get (a_list: like head_link_items_internal)
			-- Gather local `head_link_items_internal' into `a_list'
			-- Recursively gather `head_link_items_internal' from `contents' into `a_list'
		do
			across
				head_link_items_internal as ic
			loop
				a_list.force (ic.item, ic.item.hash_code)
			end
			across
				contents as ic
			loop
				ic.item.head_link_items_get (a_list)
			end
		end

	-- <head><script>
	head_script_items: like head_script_items_temp
		do
			Result := head_script_items_temp
		end

	head_script_items_refresh
			-- Refresh of `head_script_items_internal' from `head_script_items_get'.
		do
			head_script_items_temp.wipe_out
			across head_script_items_internal as ic loop head_script_items_temp.force (ic.item, ic.key) end
			head_script_items_get (head_script_items_temp)
		end

	head_script_items_get (a_list: like head_script_items_internal)
			-- Gather local `head_script_items_internal' into `a_list'
			-- Recursively gather `head_script_items_internal' from `contents' into `a_list'
		do
			across
				head_script_items_internal as ic
			loop
				a_list.force (ic.item, ic.item.hash_code)
			end
			across
				contents as ic
			loop
				ic.item.head_script_items_get (a_list)
			end
		end

	-- <head><style>
	head_style_items: like head_style_items_temp
		do
			Result := head_style_items_temp
		end

	head_style_items_refresh
			-- Refresh of `head_style_items_internal' from `head_style_items_get'.
		do
			head_style_items_temp.wipe_out
			across head_style_items_internal as ic loop head_style_items_temp.force (ic.item, ic.key) end
			head_style_items_get (head_style_items_temp)
		end

	head_style_items_get (a_list: like head_style_items_internal)
			-- Gather local `head_style_items_internal' into `a_list'
			-- Recursively gather `head_style_items_internal' from `contents' into `a_list'
		do
			across
				head_style_items_internal as ic
			loop
				a_list.force (ic.item, ic.item.hash_code)
			end
			across
				contents as ic
			loop
				ic.item.head_style_items_get (a_list)
			end
		end

feature -- Gathering Functions: <body>

	-- <body><link>
	body_link_items: like body_link_items_temp
		do
			Result := body_link_items_temp
		end

	body_link_items_refresh
			-- Refresh of `body_link_items_internal' from `body_link_items_get'.
		do
			body_link_items_temp.wipe_out
			across body_link_items_internal as ic loop body_link_items_temp.force (ic.item, ic.key) end
			body_link_items_get (body_link_items_temp)
		end

	body_link_items_get (a_list: like body_link_items_internal)
			-- Gather local `body_link_items_internal' into `a_list'
			-- Recursively gather `body_link_items_internal' from `contents' into `a_list'
		do
			across
				body_link_items_internal as ic
			loop
				a_list.force (ic.item, ic.item.hash_code)
			end
			across
				contents as ic
			loop
				ic.item.body_link_items_get (a_list)
			end
		end

	-- <body><script>
	body_script_items: like body_script_items_temp
		do
			Result := body_script_items_temp
		end

	body_script_items_refresh
			-- Refresh of `body_script_items_internal' from `body_script_items_get'.
		do
			body_script_items_temp.wipe_out
			across body_script_items_internal as ic loop body_script_items_temp.force (ic.item, ic.key) end
			body_script_items_get (body_script_items_temp)
		end

	body_script_items_get (a_list: like body_script_items_internal)
			-- Gather local `body_script_items_internal' into `a_list'
			-- Recursively gather `body_script_items_internal' from `contents' into `a_list'
		do
			across
				body_script_items_internal as ic
			loop
				a_list.force (ic.item, ic.item.hash_code)
			end
			across
				contents as ic
			loop
				ic.item.body_script_items_get (a_list)
			end
		end

	-- <body><style>
	body_style_items: like body_style_items_temp
		do
			Result := body_style_items_temp
		end

	body_style_items_refresh
			-- Refresh of `body_style_items_internal' from `body_style_items_get'.
		do
			body_style_items_temp.wipe_out
			across body_style_items_internal as ic loop body_style_items_temp.force (ic.item, ic.key) end
			body_style_items_get (body_style_items_temp)
		end

	body_style_items_get (a_list: like body_style_items_internal)
			-- Gather local `body_style_items_internal' into `a_list'
			-- Recursively gather `body_style_items_internal' from `contents' into `a_list'
		do
			across
				body_style_items_internal as ic
			loop
				a_list.force (ic.item, ic.item.hash_code)
			end
			across
				contents as ic
			loop
				ic.item.body_style_items_get (a_list)
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

feature {NONE} -- Implementation: <head> items

	head_meta_items_internal: HASH_TABLE [HTML_META, INTEGER] attribute create Result.make (10) end
	head_meta_items_temp: HASH_TABLE [HTML_META, INTEGER] attribute create Result.make (10) end

	head_link_items_internal: HASH_TABLE [HTML_LINK, INTEGER] attribute create Result.make (10) end
	head_link_items_temp: HASH_TABLE [HTML_LINK, INTEGER] attribute create Result.make (10) end

	head_script_items_internal: HASH_TABLE [HTML_SCRIPT, INTEGER] attribute create Result.make (10) end
	head_script_items_temp: HASH_TABLE [HTML_SCRIPT, INTEGER] attribute create Result.make (10) end

	head_style_items_internal: HASH_TABLE [HTML_STYLE, INTEGER] attribute create Result.make (10) end
	head_style_items_temp: HASH_TABLE [HTML_STYLE, INTEGER] attribute create Result.make (10) end

feature {NONE} -- Implementation: <body> items

	body_link_items_internal: HASH_TABLE [HTML_LINK, INTEGER] attribute create Result.make (10) end
	body_link_items_temp: HASH_TABLE [HTML_LINK, INTEGER] attribute create Result.make (10) end

	body_script_items_internal: HASH_TABLE [HTML_SCRIPT, INTEGER] attribute create Result.make (10) end
	body_script_items_temp: HASH_TABLE [HTML_SCRIPT, INTEGER] attribute create Result.make (10) end

	body_style_items_internal: HASH_TABLE [HTML_STYLE, INTEGER] attribute create Result.make (10) end
	body_style_items_temp: HASH_TABLE [HTML_STYLE, INTEGER] attribute create Result.make (10) end

feature {NONE} -- Implementation: Output

	Not_pretty: BOOLEAN = False
	Prettified: BOOLEAN = True

	common_out (a_prettified: like Prettified): STRING
			-- `common_out' of `a_prettified' (True/False).
		local
			l_content,
			l_modified_start_tag,
			l_template: STRING
		do
			create Result.make_empty

				-- Start tag ...
			if is_minifiable then -- exclude_end_tag and
				l_modified_start_tag := start_tag.twin
				l_modified_start_tag.insert_character ('/', l_modified_start_tag.count)
				Result.append_string_general (l_modified_start_tag)
			else
				Result.append_string_general (start_tag)
			end
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
			if is_minifiable then -- exclude_end_tag and
				do_nothing -- Do not put an end tag
			else
				Result.append_string (end_tag)
			end
			if a_prettified then Result.append_character ('%N'); Result.append_character ('%T') end
		end

	attributes_out: STRING
			-- <Precursor>
		do
			if attached {STRING} css_inline_out as al_css_inline_out and then
				not al_css_inline_out.is_empty
			then
				set_style (al_css_inline_out)
			end
			Result := Precursor
		end

	is_minifiable: BOOLEAN
		do
			Result := not start_tag.is_empty and
						contents.is_empty and
						text_content.is_empty and
						(
						attached {HTML_META} Current or
						attached {HTML_IMG} Current or
						attached {HTML_INPUT} Current or
						attached {HTML_LINK} Current
						)
		end

	content_only_html_out (a_prettified: like Prettified): STRING
			-- The `content_only_html_out', which is the "stuff" between the `Start_tag' and `End_tag'
		do
			create Result.make_empty
			across
				contents as ic_content_list
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
				Result := "<"
				Result.append_string_general (tag_name)
				Result.append_string_general (tag_attributes_tag)
				Result.append_string_general (">")
			else
				Result := ""
			end
		end

	exclude_end_tag: BOOLEAN

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
