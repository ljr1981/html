note
	description: "[
		Representation of common {HTML_ATTRIBUTES}.
		]"
	design: "[
		There are two groups of attributes: Global and Tag-specific
		The feature group names reflect this grouping mechanism.
		
		Global attributes are defined as those attribute belonging
		to and shared by all HTML <tag>'s. Tag-specific are those
		used by less than all (perhaps by just one or two or more).
		
		Global attributes are exported and available to clients of
		the HTML <tag> classes by way of the feature group mechanism,
		where the feature group for Globals has been exported to {ANY}.
		
		Tag-specific attributes are exported to {NONE}, which means
		that (as-is) no Client may have access. To provide Tag-specific
		Client access, the attribute features are exposed to the Clients
		by way of the "export" redefinition mechanism in Eiffel inheritance.
		You can see this demonstrated in any descendent class inheritance
		clause (e.g. html/inline/{HTML_A}).
		]"
	history: "[
		The original design was to put the Tag-specific attributes
		directly in the classes for each attribute. However, because
		some attributes are shared by more than one tag, but not all
		it seemed a better design to place all attributes in this class
		and then parse the Globals and Tag-specifics with two distinct
		mechanisms.
		]"

deferred class
	HTML_ATTRIBUTES

inherit
	HTML_ANY
		undefine
			out
		end

	FW_ATTRIBUTE_HELPER
		redefine
			attribute_separator,
			attribute_list
		end

	HTML
		undefine
			default_create,
			out
		end

feature -- Global Attributes

	global_accesskey: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_global_accesskey.asp"
		attribute Result := ["", "", Void, accesskey_kw, is_quoted] ensure Result.attr_name.same_string (accesskey_kw) end

	global_class: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_global_class.asp"
				example: "class=%"thing1 thing2 thing3%""
				description: "[
					HTML <TAG> things can be given any number of classes that they
					belong to (e.g. thing1 thing2 thing3), where the list is a space-delimited
					list. However, if the class represents a CSS specification and
					several CSS specification have competing specs, then the last spec
					wins!
					
					The class attribute is mostly used to point to a class in a style sheet. 
					However, it can also be used by a JavaScript (via the HTML DOM) to make 
					changes to HTML elements with a specified class.
					]"
		attribute Result := ["", "", Void, class_kw, is_quoted] ensure Result.attr_name.same_string (class_kw) end

	global_id: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_global_id.asp"
				example: "id=%"my_id_thing%""
				description: "[
					The id attribute specifies a unique id for an HTML element (the value 
					must be unique within the HTML document).
					]"
		attribute Result := ["", "", Void, id_kw, is_quoted] ensure Result.attr_name.same_string (id_kw) end

	global_style: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_global_style.asp"
		attribute Result := ["", "", Void, style_kw, is_quoted] ensure Result.attr_name.same_string (style_kw) end

feature {NONE} -- Aria

	aria_hidden: attached like attribute_tuple_anchor
		attribute Result := ["", "", Void, aria_hidden_kw, is_quoted] ensure Result.attr_name.same_string (aria_hidden_kw) end

	aria_label: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_aria_label.asp"
		attribute Result := ["", "", Void, aria_label_kw, is_quoted] ensure Result.attr_name.same_string (aria_label_kw) end

	aria_multiselectable: attached like attribute_tuple_anchor
		attribute Result := [no_value, no_default, no_minimum, aria_multiselectable_kw, is_quoted] ensure Result.attr_name.same_string (aria_multiselectable_kw) end

feature {NONE} -- Tag-specific Attributes

	-- To expose these attributes to Clients, please use the export
	-- inheritance mechanism.

	-- For example:
	--		class
	--			MY_HTML_CLASS
	--
	--		inherit
	--			HTML_MY_TAG
	--				export {ANY} 			<-- Redefines the export status
	--					my_attribute 		<-- of this particular feature
	--				end

	action: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_action.asp"
		attribute Result := ["", "", Void, action_kw, is_quoted] ensure Result.attr_name.same_string (action_kw) end

	align: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_align.asp"
		attribute Result := ["", "", Void, align_kw, is_quoted] ensure Result.attr_name.same_string (align_kw) end

	valign: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_valign.asp"
		attribute Result := ["", "", Void, valign_kw, is_quoted] ensure Result.attr_name.same_string (valign_kw) end

	alt: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_alt.asp"
		attribute Result := ["", "", Void, alt_kw, is_quoted] ensure Result.attr_name.same_string (alt_kw) end

	autocomplete: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_autocomplete.asp"
		attribute Result := ["", "", Void, autocomplete_kw, is_quoted] ensure Result.attr_name.same_string (autocomplete_kw) end

	border: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_table_border.asp"
		attribute Result := ["", "", Void, border_kw, is_quoted] ensure Result.attr_name.same_string (border_kw) end

	cols: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_cols.asp"
		attribute Result := ["", "", Void, cols_kw, is_quoted] ensure Result.attr_name.same_string (cols_kw) end

	colspan: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_colspan.asp"
		attribute Result := ["", "", Void, colspan_kw, is_quoted] ensure Result.attr_name.same_string (colspan_kw) end

	content: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_content.asp"
		attribute Result := ["", "", Void, content_kw, is_quoted] ensure Result.attr_name.same_string (content_kw) end

	cell_spacing: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_cellspacing.asp"
		attribute Result := ["", "", Void, cell_spacing_kw, is_quoted] ensure Result.attr_name.same_string (cell_spacing_kw) end

	cell_padding: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_cellpadding.asp"
		attribute Result := ["", "", Void, cell_padding_kw, is_quoted] ensure Result.attr_name.same_string (cell_padding_kw) end

	charset: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/charset.asp"
		attribute Result := ["", "", Void, charset_kw, is_quoted] ensure Result.attr_name.same_string (charset_kw) end

	contenteditable: attached like attribute_tuple_anchor
		note EIS: "src=https://www.w3schools.com/tags/att_global_contenteditable.asp"
		attribute Result := ["", "|false|true", Void, contenteditable_kw, is_quoted] ensure Result.attr_name.same_string (contenteditable_kw) end

	crossorigin: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_crossorigin.asp"
		attribute Result := ["", "", Void, crossorigin_kw, is_quoted] ensure Result.attr_name.same_string (crossorigin_kw) end

	for: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_for.asp"
		attribute Result := ["", "", Void, for_kw, is_quoted] ensure Result.attr_name.same_string (for_kw) end

	frameborder: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_frameborder.asp"
		attribute Result := ["", "", Void, frameborder_kw, is_quoted] ensure Result.attr_name.same_string (frameborder_kw) end

	height: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_height.asp"
		attribute Result := ["", "", Void, height_kw, is_quoted] ensure Result.attr_name.same_string (height_kw) end

	html_equiv: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/html_equiv.asp"
		attribute Result := ["", "", Void, html_equiv_kw, is_quoted] ensure Result.attr_name.same_string (html_equiv_kw) end

	href: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_a_href.asp"
		attribute Result := ["", "", Void, href_kw, is_quoted] ensure Result.attr_name.same_string (href_kw) end

	hreflang: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_a_hreflang.asp"
		attribute Result := ["", "", Void, hreflang_kw, is_quoted] ensure Result.attr_name.same_string (hreflang_kw) end

	itemscope: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_itemscope.asp"
		attribute Result := ["", "", Void, itemscope_kw, is_quoted] ensure Result.attr_name.same_string (itemscope_kw) end

	itemtype: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_itemtype.asp"
		attribute Result := ["", "", Void, itemtype_kw, is_quoted] ensure Result.attr_name.same_string (itemtype_kw) end

	lang, language: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_lang.asp"
		attribute Result := ["", "", Void, lang_kw, is_quoted] ensure Result.attr_name.same_string (lang_kw) end

	media: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_media.asp"
		attribute Result := ["", "", Void, media_kw, is_quoted] ensure Result.attr_name.same_string (media_kw) end

	method: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_method.asp"
		attribute Result := ["", "", Void, method_kw, is_quoted] ensure Result.attr_name.same_string (method_kw) end

	maxlength: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_maxlength.asp"
		attribute Result := ["", "", Void, maxlength_kw, is_quoted] ensure Result.attr_name.same_string (maxlength_kw) end

	name: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_name.asp"
		attribute Result := ["", "", Void, name_kw, is_quoted] ensure Result.attr_name.same_string (name_kw) end

	pattern: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_placeholder.asp"
		attribute Result := ["", "", Void, pattern_kw, is_quoted] ensure Result.attr_name.same_string (pattern_kw) end

	placeholder: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_placeholder.asp"
		attribute Result := ["", "", Void, placeholder_kw, is_quoted] ensure Result.attr_name.same_string (placeholder_kw) end

	property: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_property.asp"
		attribute Result := ["", "", Void, property_kw, is_quoted] ensure Result.attr_name.same_string (property_kw) end

	rel: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/TAgs/att_a_rel.asp"
		attribute Result := ["", "", Void, rel_kw, is_quoted] ensure Result.attr_name.same_string (rel_kw) end

	role: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_role.asp"
		attribute Result := ["", "", Void, role_kw, is_quoted] ensure Result.attr_name.same_string (role_kw) end

	rows: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_role.asp"
		attribute Result := ["", "", Void, rows_kw, is_quoted] ensure Result.attr_name.same_string (rows_kw) end

	rowspan: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_rowspan.asp"
		attribute Result := ["", "", Void, rowspan_kw, is_quoted] ensure Result.attr_name.same_string (rowspan_kw) end

	size: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_size.asp"
		attribute Result := ["", "", Void, size_kw, is_quoted] ensure Result.attr_name.same_string (size_kw) end
	no_size: INTEGER = 0

	sizes: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_sizes.asp"
		attribute Result := ["", "", Void, sizes_kw, is_quoted] ensure Result.attr_name.same_string (sizes_kw) end

	src, source: attached like attribute_tuple_anchor
		note EIS: "srcattribute //www.w3schools.com/tags/attr_src.asp"
		attribute Result := ["", "", Void, src_kw, is_quoted] ensure Result.attr_name.same_string (src_kw) end

	status: attached like attribute_tuple_anchor
		note EIS: "srcattribute //www.w3schools.com/tags/attr_status.asp"
		attribute Result := ["", "", Void, status_kw, is_quoted] ensure Result.attr_name.same_string (status_kw) end

	style: attached like attribute_tuple_anchor
		note EIS: "srcattribute //www.w3schools.com/tags/attr_style.asp"
		attribute Result := ["", "", Void, style_kw, is_quoted] ensure Result.attr_name.same_string (style_kw) end

	target: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_target.asp"
		attribute Result := ["", "", Void, target_kw, is_quoted] ensure Result.attr_name.same_string (target_kw) end

	title: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_type.asp"
		attribute Result := ["", "", Void, title_kw, is_quoted] ensure Result.attr_name.same_string (title_kw) end

	type: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_type.asp"
		attribute Result := ["", "", Void, type_kw, is_quoted] ensure Result.attr_name.same_string (type_kw) end

	value: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_value.asp"
		attribute Result := ["", "", Void, value_kw, is_quoted] ensure Result.attr_name.same_string (value_kw) end

	width: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_width.asp"
		attribute Result := ["", "", Void, width_kw, is_quoted] ensure Result.attr_name.same_string (width_kw) end
	width_values: STRING = "soft|hard|physical"

	wrap: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_textarea_wrap.asp"
		attribute Result := ["", "", Void, wrap_kw, is_quoted] ensure Result.attr_name.same_string (wrap_kw) end

	xml_lang, xml_language: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_xml_lang.asp"
		attribute Result := ["", "", Void, xml_lang_kw, is_quoted] ensure Result.attr_name.same_string (xml_lang_kw) end

	xmlns: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_xmlns.asp"
		attribute Result := ["", "", Void, xmlns_kw, is_quoted] ensure Result.attr_name.same_string (xmlns_kw) end

feature -- Attributes: Global Events

	on_after_print: attached like attribute_tuple_anchor
			--onafterprint	script	Script to be run after the document is printed
		attribute Result := ["", "", Void, onafterprint_kw, is_quoted] ensure Result.attr_name.same_string (onafterprint_kw) end

	on_before_print: attached like attribute_tuple_anchor
			--onbeforeprint	script	Script to be run before the document is printed
		attribute Result := ["", "", Void, onbeforeprint_kw, is_quoted] ensure Result.attr_name.same_string (onbeforeprint_kw) end

	on_before_unload: attached like attribute_tuple_anchor
			-- `on_before_unload'	script	Script to be run when the document is about to be unloaded
		attribute Result := ["", "", Void, onbeforeunload_kw, is_quoted] ensure Result.attr_name.same_string (onbeforeunload_kw) end

	on_error: attached like attribute_tuple_anchor
			--`on_error'			script	Script to be run when an error occurs
		attribute Result := ["", "", Void, onerror_kw, is_quoted] ensure Result.attr_name.same_string (onerror_kw) end

	on_hash_change: attached like attribute_tuple_anchor
			--`on_hash_change'	script	Script to be run when there has been changes to the anchor part of the a URL
		attribute Result := ["", "", Void, onhashchange_kw, is_quoted] ensure Result.attr_name.same_string (onhashchange_kw) end

	on_load: attached like attribute_tuple_anchor
			--`on_load'			script	Fires after the page is finished loading
		attribute Result := ["", "", Void, onload_kw, is_quoted] ensure Result.attr_name.same_string (onload_kw) end

	on_message: attached like attribute_tuple_anchor
			--`on_message'		script	Script to be run when the message is triggered
		attribute Result := ["", "", Void, onmessage_kw, is_quoted] ensure Result.attr_name.same_string (onmessage_kw) end

	on_offline: attached like attribute_tuple_anchor
			--`on_offline'		script	Script to be run when the browser starts to work offline
		attribute Result := ["", "", Void, onoffline_kw, is_quoted] ensure Result.attr_name.same_string (onoffline_kw) end

	on_online: attached like attribute_tuple_anchor
			--`on_online'		script	Script to be run when the browser starts to work online
		attribute Result := ["", "", Void, ononline_kw, is_quoted] ensure Result.attr_name.same_string (ononline_kw) end

	on_page_hide: attached like attribute_tuple_anchor
			--`on_page_hide'		script	Script to be run when a user navigates away from a page
		attribute Result := ["", "", Void, onpagehide_kw, is_quoted] ensure Result.attr_name.same_string (onpagehide_kw) end

	on_page_show: attached like attribute_tuple_anchor
			--`on_page_show'		script	Script to be run when a user navigates to a page
		attribute Result := ["", "", Void, onpageshow_kw, is_quoted] ensure Result.attr_name.same_string (onpageshow_kw) end

	on_pop_state: attached like attribute_tuple_anchor
			--`on_pop_state'		script	Script to be run when the window's history changes
		attribute Result := ["", "", Void, onpopstate_kw, is_quoted] ensure Result.attr_name.same_string (onpopstate_kw) end

	on_resize: attached like attribute_tuple_anchor
			--`on_resize'		script	Fires when the browser window is resized
		attribute Result := ["", "", Void, onresize_kw, is_quoted] ensure Result.attr_name.same_string (onresize_kw) end

	on_storage: attached like attribute_tuple_anchor
			--`on_storage'		script	Script to be run when a Web Storage area is updated
		attribute Result := ["", "", Void, onstorage_kw, is_quoted] ensure Result.attr_name.same_string (onstorage_kw) end

	on_unload: attached like attribute_tuple_anchor
			--`on_unload'		script	Fires once a page has unloaded (or the browser window has been closed)
		attribute Result := ["", "", Void, onunload_kw, is_quoted] ensure Result.attr_name.same_string (onunload_kw) end

feature {NONE} -- Attributes: Form Events

	on_blur: attached like attribute_tuple_anchor
			--`on_blur'			script	Fires the moment that the element loses focus
		attribute Result := ["", "", Void, onblur_kw, is_quoted] ensure Result.attr_name.same_string (onblur_kw) end

	on_change: attached like attribute_tuple_anchor
			--`on_change'		script	Fires the moment when the value of the element is changed
		attribute Result := ["", "", Void, onchange_kw, is_quoted] ensure Result.attr_name.same_string (onchange_kw) end

	on_context_menu: attached like attribute_tuple_anchor
			--`on_context_menu'	script	Script to be run when a context menu is triggered
		attribute Result := ["", "", Void, oncontextmenu_kw, is_quoted] ensure Result.attr_name.same_string (oncontextmenu_kw) end

	on_focus: attached like attribute_tuple_anchor
			--`on_focus'			script	Fires the moment when the element gets focus
		attribute Result := ["", "", Void, onfocus_kw, is_quoted] ensure Result.attr_name.same_string (onfocus_kw) end

	on_input: attached like attribute_tuple_anchor
			--`on_input'			script	Script to be run when an element gets user input
		attribute Result := ["", "", Void, oninput_kw, is_quoted] ensure Result.attr_name.same_string (oninput_kw) end

	on_invalid: attached like attribute_tuple_anchor
			--`on_invalid'		script	Script to be run when an element is invalid
		attribute Result := ["", "", Void, oninvalid_kw, is_quoted] ensure Result.attr_name.same_string (oninvalid_kw) end

	on_reset: attached like attribute_tuple_anchor
			--`on_reset'			script	Fires when the Reset button in a form is clicked
		attribute Result := ["", "", Void, onreset_kw, is_quoted] ensure Result.attr_name.same_string (onreset_kw) end

	on_search: attached like attribute_tuple_anchor
			--`on_search'		script	Fires when the user writes something in a search field (for <input="search">)
		attribute Result := ["", "", Void, onsearch_kw, is_quoted] ensure Result.attr_name.same_string (onsearch_kw) end

	on_select: attached like attribute_tuple_anchor
			--`on_select'		script	Fires after some text has been selected in an element
		attribute Result := ["", "", Void, onselect_kw, is_quoted] ensure Result.attr_name.same_string (onselect_kw) end

	on_submit: attached like attribute_tuple_anchor
			--`on_submit'		script	Fires when a form is submitted
		attribute Result := ["", "", Void, onsubmit_kw, is_quoted] ensure Result.attr_name.same_string (onsubmit_kw) end

feature {NONE} -- Attributes: Keyboard Events

	on_key_down: attached like attribute_tuple_anchor
			--`on_key_down'	script	Fires when a user is pressing a key
		attribute Result := ["", "", Void, onkeydown_kw, is_quoted] ensure Result.attr_name.same_string (onkeydown_kw) end

	on_key_press: attached like attribute_tuple_anchor
			--`on_key_press'	script	Fires when a user presses a key
		attribute Result := ["", "", Void, onkeypress_kw, is_quoted] ensure Result.attr_name.same_string (onkeypress_kw) end

	on_key_up: attached like attribute_tuple_anchor
			--`on_key_up'	script	Fires when a user releases a key
		attribute Result := ["", "", Void, onkeyup_kw, is_quoted] ensure Result.attr_name.same_string (onkeyup_kw) end

feature {NONE} -- Attributes: Mouse Events

	on_click: attached like attribute_tuple_anchor
			--`onclick'	script	Fires on a mouse click on the element
		attribute Result := ["", "", Void, onclick_kw, is_quoted] ensure Result.attr_name.same_string (onclick_kw) end

	on_dbl_click: attached like attribute_tuple_anchor
			--`on_dbl_click'	script	Fires on a mouse double-click on the element
		attribute Result := ["", "", Void, ondblclick_kw, is_quoted] ensure Result.attr_name.same_string (ondblclick_kw) end

	on_drag: attached like attribute_tuple_anchor
			--`on_drag'	script	Script to be run when an element is dragged
		attribute Result := ["", "", Void, ondrag_kw, is_quoted] ensure Result.attr_name.same_string (ondrag_kw) end

	on_drag_end: attached like attribute_tuple_anchor
			--`on_drag_end'	script	Script to be run at the end of a drag operation
		attribute Result := ["", "", Void, ondragend_kw, is_quoted] ensure Result.attr_name.same_string (ondragend_kw) end

	on_drag_enter: attached like attribute_tuple_anchor
			--`on_drag_enter'	script	Script to be run when an element has been dragged to a valid drop target
		attribute Result := ["", "", Void, ondragenter_kw, is_quoted] ensure Result.attr_name.same_string (ondragenter_kw) end

	on_drag_leave: attached like attribute_tuple_anchor
			--`on_drag_leave'	script	Script to be run when an element leaves a valid drop target
		attribute Result := ["", "", Void, ondragleave_kw, is_quoted] ensure Result.attr_name.same_string (ondragleave_kw) end

	on_drag_over: attached like attribute_tuple_anchor
			--`on_drag_over'	script	Script to be run when an element is being dragged over a valid drop target
		attribute Result := ["", "", Void, ondragover_kw, is_quoted] ensure Result.attr_name.same_string (ondragover_kw) end

	on_drag_start: attached like attribute_tuple_anchor
			--`on_drag_start'	script	Script to be run at the start of a drag operation
		attribute Result := ["", "", Void, ondragstart_kw, is_quoted] ensure Result.attr_name.same_string (ondragstart_kw) end

	on_drop: attached like attribute_tuple_anchor
			--`on_drop'	script	Script to be run when dragged element is being dropped
		attribute Result := ["", "", Void, ondrop_kw, is_quoted] ensure Result.attr_name.same_string (ondrop_kw) end

	on_mouse_down: attached like attribute_tuple_anchor
			--`on_mouse_down'	script	Fires when a mouse button is pressed down on an element
		attribute Result := ["", "", Void, onmousedown_kw, is_quoted] ensure Result.attr_name.same_string (onmousedown_kw) end

	on_mouse_move: attached like attribute_tuple_anchor
			--`on_mouse_move'	script	Fires when the mouse pointer is moving while it is over an element
		attribute Result := ["", "", Void, onmousemove_kw, is_quoted] ensure Result.attr_name.same_string (onmousemove_kw) end

	on_mouse_out: attached like attribute_tuple_anchor
			--`on_mouse_out'	script	Fires when the mouse pointer moves out of an element
		attribute Result := ["", "", Void, onmouseout_kw, is_quoted] ensure Result.attr_name.same_string (onmouseout_kw) end

	on_mouse_over: attached like attribute_tuple_anchor
			--`on_mouse_over'	script	Fires when the mouse pointer moves over an element
		attribute Result := ["", "", Void, onmouseover_kw, is_quoted] ensure Result.attr_name.same_string (onmouseover_kw) end

	on_mouse_up: attached like attribute_tuple_anchor
			--`on_mouse_up'	script	Fires when a mouse button is released over an element
		attribute Result := ["", "", Void, onmouseup_kw, is_quoted] ensure Result.attr_name.same_string (onmouseup_kw) end

	on_mouse_wheel: attached like attribute_tuple_anchor
			--`on_mouse_wheel'	script	Deprecated. Use the onwheel attribute instead
		obsolete "use on_wheel instead." attribute Result := ["", "", Void, onmousewheel_kw, is_quoted] ensure Result.attr_name.same_string (onmousewheel_kw) end

	on_scroll: attached like attribute_tuple_anchor
			--`on_scroll'	script	Script to be run when an element's scrollbar is being scrolled
		attribute Result := ["", "", Void, onscroll_kw, is_quoted] ensure Result.attr_name.same_string (onscroll_kw) end

	on_wheel: attached like attribute_tuple_anchor
			--`on_wheel'	script	Fires when the mouse wheel rolls up or down over an element
		attribute Result := ["", "", Void, onwheel_kw, is_quoted] ensure Result.attr_name.same_string (onwheel_kw) end

feature {NONE} -- Attributes: Clipboard Events

	on_copy: attached like attribute_tuple_anchor
			--`on_copy'	script	Fires when the user copies the content of an element
		attribute Result := ["", "", Void, oncopy_kw, is_quoted] ensure Result.attr_name.same_string (oncopy_kw) end

	on_cut: attached like attribute_tuple_anchor
			--`on_cut'	script	Fires when the user cuts the content of an element
		attribute Result := ["", "", Void, oncut_kw, is_quoted] ensure Result.attr_name.same_string (oncut_kw) end

	on_paste: attached like attribute_tuple_anchor
			--`on_paste'	script	Fires when the user pastes some content in an element
		attribute Result := ["", "", Void, onpaste_kw, is_quoted] ensure Result.attr_name.same_string (onpaste_kw) end

feature {NONE} -- Attributes: Media Events

	on_abort: attached like attribute_tuple_anchor
			--`on_abort'	script	Script to be run on abort
		attribute Result := ["", "", Void, onabort_kw, is_quoted] ensure Result.attr_name.same_string (onabort_kw) end

	on_can_play: attached like attribute_tuple_anchor
			--`on_can_play'	script	Script to be run when a file is ready to start playing (when it has buffered enough to begin)
		attribute Result := ["", "", Void, oncanplay_kw, is_quoted] ensure Result.attr_name.same_string (oncanplay_kw) end

	on_can_play_through: attached like attribute_tuple_anchor
			--`on_can_play_through'	script	Script to be run when a file can be played all the way to the end without pausing for buffering
		attribute Result := ["", "", Void, oncanplaythrough_kw, is_quoted] ensure Result.attr_name.same_string (oncanplaythrough_kw) end

	on_cue_change: attached like attribute_tuple_anchor
			--`on_cue_change'	script	Script to be run when the cue changes in a <track> element
		attribute Result := ["", "", Void, oncuechange_kw, is_quoted] ensure Result.attr_name.same_string (oncuechange_kw) end

	on_duration_change: attached like attribute_tuple_anchor
			--`on_duration_change'	script	Script to be run when the length of the media changes
		attribute Result := ["", "", Void, ondurationchange_kw, is_quoted] ensure Result.attr_name.same_string (ondurationchange_kw) end

	on_emptied: attached like attribute_tuple_anchor
			--`on_emptied'	script	Script to be run when something bad happens and the file is suddenly unavailable (like unexpectedly disconnects)
		attribute Result := ["", "", Void, onemptied_kw, is_quoted] ensure Result.attr_name.same_string (onemptied_kw) end

	on_ended: attached like attribute_tuple_anchor
			--`on_ended'	script	Script to be run when the media has reach the end (a useful event for messages like "thanks for listening")
		attribute Result := ["", "", Void, onended_kw, is_quoted] ensure Result.attr_name.same_string (onended_kw) end

	on_loaded_data: attached like attribute_tuple_anchor
			--`on_loaded_data'	script	Script to be run when media data is loaded
		attribute Result := ["", "", Void, onloadeddata_kw, is_quoted] ensure Result.attr_name.same_string (onloadeddata_kw) end

	on_loaded_meta_data: attached like attribute_tuple_anchor
			--`on_loaded_meta_data'	script	Script to be run when meta data (like dimensions and duration) are loaded
		attribute Result := ["", "", Void, onloadedmetadata_kw, is_quoted] ensure Result.attr_name.same_string (onloadedmetadata_kw) end

	on_load_start: attached like attribute_tuple_anchor
			--`on_load_start'	script	Script to be run just as the file begins to load before anything is actually loaded
		attribute Result := ["", "", Void, onloadstart_kw, is_quoted] ensure Result.attr_name.same_string (onloadstart_kw) end

	on_pause: attached like attribute_tuple_anchor
			--`on_pause'	script	Script to be run when the media is paused either by the user or programmatically
		attribute Result := ["", "", Void, onpause_kw, is_quoted] ensure Result.attr_name.same_string (onpause_kw) end

	on_play: attached like attribute_tuple_anchor
			--`on_play'	script	Script to be run when the media is ready to start playing
		attribute Result := ["", "", Void, onplay_kw, is_quoted] ensure Result.attr_name.same_string (onplay_kw) end

	on_playing: attached like attribute_tuple_anchor
			--`on_playing'	script	Script to be run when the media actually has started playing
		attribute Result := ["", "", Void, onplaying_kw, is_quoted] ensure Result.attr_name.same_string (onplaying_kw) end

	on_progress: attached like attribute_tuple_anchor
			--`on_progress'	script	Script to be run when the browser is in the process of getting the media data
		attribute Result := ["", "", Void, onprogress_kw, is_quoted] ensure Result.attr_name.same_string (onprogress_kw) end

	on_rate_change: attached like attribute_tuple_anchor
			--`on_rate_change'	script	Script to be run each time the playback rate changes (like when a user switches to a slow motion or fast forward mode)
		attribute Result := ["", "", Void, onratechange_kw, is_quoted] ensure Result.attr_name.same_string (onratechange_kw) end

	on_seeked: attached like attribute_tuple_anchor
			--`on_seeked'	script	Script to be run when the seeking attribute is set to false indicating that seeking has ended
		attribute Result := ["", "", Void, onseeked_kw, is_quoted] ensure Result.attr_name.same_string (onseeked_kw) end

	on_seeking: attached like attribute_tuple_anchor
			--`on_seeking'	script	Script to be run when the seeking attribute is set to true indicating that seeking is active
		attribute Result := ["", "", Void, onseeking_kw, is_quoted] ensure Result.attr_name.same_string (onseeking_kw) end

	on_stalled: attached like attribute_tuple_anchor
			--`on_stalled'	script	Script to be run when the browser is unable to fetch the media data for whatever reason
		attribute Result := ["", "", Void, onstalled_kw, is_quoted] ensure Result.attr_name.same_string (onstalled_kw) end

	on_suspend: attached like attribute_tuple_anchor
			--`on_suspend'	script	Script to be run when fetching the media data is stopped before it is completely loaded for whatever reason
		attribute Result := ["", "", Void, onsuspend_kw, is_quoted] ensure Result.attr_name.same_string (onsuspend_kw) end

	on_time_update: attached like attribute_tuple_anchor
			--`on_time_update'	script	Script to be run when the playing position has changed (like when the user fast forwards to a different point in the media)
		attribute Result := ["", "", Void, ontimeupdate_kw, is_quoted] ensure Result.attr_name.same_string (ontimeupdate_kw) end

	on_volume_change: attached like attribute_tuple_anchor
			--`on_volume_change'	script	Script to be run each time the volume is changed which (includes setting the volume to "mute")
		attribute Result := ["", "", Void, onvolumechange_kw, is_quoted] ensure Result.attr_name.same_string (onvolumechange_kw) end

	on_waiting: attached like attribute_tuple_anchor
			--`on_waiting'	script	Script to be run when the media has paused but is expected to resume (like when the media pauses to buffer more data)
		attribute Result := ["", "", Void, onwaiting_kw, is_quoted] ensure Result.attr_name.same_string (onwaiting_kw) end

feature {NONE} -- Attributes: Datums

	data_add_back_btn: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["false", "false|true", Void, data_add_back_btn_kw, is_quoted] ensure Result.attr_name.same_string (data_add_back_btn_kw) end
		--data-add-back-btn	true | false - Auto add back button, header only

	data_auto_init: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["false", "false|true", Void, data_auto_init_kw, is_quoted] ensure Result.attr_name.same_string (data_auto_init_kw) end

	data_back_btn_text: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_back_btn_text_kw, is_quoted] ensure Result.attr_name.same_string (data_back_btn_text_kw) end
		--data-back-btn-text	string

	data_back_btn_theme: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, dat_back_btn_theme_kw, is_quoted] ensure Result.attr_name.same_string (dat_back_btn_theme_kw) end
		--data-back-btn-theme	swatch letter (a-z)

	data_close_btn_text: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_close_btn_text_kw, is_quoted] ensure Result.attr_name.same_string (data_close_btn_text_kw) end
		--data-close-btn-text	string - Text for the close button, dialog only

	data_direction: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_direction_kw, is_quoted] ensure Result.attr_name.same_string (data_direction_kw) end
		--data-direction	reverse - Reverse transition animation (only for page or dialog)

	data_dismiss: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_dismiss_kw, is_quoted] ensure Result.attr_name.same_string (data_dismiss_kw) end
		--data-dismiss	string - ???

	data_dom_cache: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["false", "false|true", Void, data_dom_cache_kw, is_quoted] ensure Result.attr_name.same_string (data_dom_cache_kw) end
		--data-dom-cache	true | false

	data_easing: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-easing.html"
		attribute Result := ["", "", Void, data_easing_kw, is_quoted] ensure Result.attr_name.same_string (data_easing_kw) end
		--data-easing

	data_fullscreen: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["false", "false|true", Void, data_fullscreen_kw, is_quoted] ensure Result.attr_name.same_string (data_fullscreen_kw) end
		--data-fullscreen	true | false - Used in conjunction with fixed toolbars

	data_holder_rendered: attached like attribute_tuple_anchor
		attribute Result := ["", "", Void, data_holder_rendered_kw, is_quoted] ensure Result.attr_name.same_string (data_holder_rendered_kw) end

	data_icon: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["home", "home|delete|plus|arrow-u|arrow-d|check|gear|grid|star|custom|arrow-r|arrow-l|minus|refresh|forward|back|alert|info|search", Void, data_icon_kw, is_quoted] ensure Result.attr_name.same_string (data_icon_kw) end
		-- data-icon	home | delete | plus | arrow-u | arrow-d | check | gear | grid | star | custom | arrow-r | arrow-l | minus | refresh | forward | back | alert | info | search

	data_id: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_id_kw, is_quoted] ensure Result.attr_name.same_string (data_id_kw) end
		--data-id	string - Unique ID. Required for persistent headers

	data_inline: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["false", "false|true", Void, data_inline_kw, is_quoted] ensure Result.attr_name.same_string (data_inline_kw) end
		--data-inline	true | false - Auto add back button, header only

	data_overlay_theme: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_overlay_theme_kw, is_quoted] ensure Result.attr_name.same_string (data_overlay_theme_kw) end
		--data-overlay-theme	swatch letter (a-z) - Overlay theme when the page is opened in a dialog

	data_position: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_position_kw, is_unquoted] ensure Result.attr_name.same_string (data_position_kw) end
		--data-position	fixed

	data_rel: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["back", "back|dialog|external|popup", Void, data_rel_kw, is_quoted] ensure Result.attr_name.same_string (data_rel_kw) end
		--data-rel	back - To move one step back in history
		--dialog - To open link styled as dialog, not tracked in history
		--external - For linking to another domain
		--popup - For opening a popup

	data_ride: attached like attribute_tuple_anchor
		attribute Result := ["", "", Void, data_ride_kw, is_quoted] ensure Result.attr_name.same_string (data_ride_kw) end

	data_role: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_role_kw, is_quoted] ensure Result.attr_name.same_string (data_role_kw) end
		--data-role

	data_slide: attached like attribute_tuple_anchor
		attribute Result := ["", "", Void, data_slide_kw, is_quoted] ensure Result.attr_name.same_string (data_slide_kw) end

	data_slide_to: attached like attribute_tuple_anchor
		attribute Result := ["", "", Void, data_slide_to_kw, is_quoted] ensure Result.attr_name.same_string (data_slide_to_kw) end

	data_speed: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-speed.html"
		attribute Result := ["", "", Void, data_speed_kw, is_quoted] ensure Result.attr_name.same_string (data_speed_kw) end
		--data-speed

	data_src: attached like attribute_tuple_anchor
		attribute Result := ["", "", Void, data_src_kw, is_quoted] ensure Result.attr_name.same_string (data_src_kw) end

	data_start: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-start.html"
		attribute Result := ["", "", Void, data_start_kw, is_quoted] ensure Result.attr_name.same_string (data_start_kw) end
		--data-start

	data_target: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-target.html"
		attribute Result := ["", "", Void, data_target_kw, is_quoted] ensure Result.attr_name.same_string (data_target_kw) end
		--data-target

	data_theme: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_theme_kw, is_quoted] ensure Result.attr_name.same_string (data_theme_kw) end
		--data-theme	swatch letter (a-z) - Default "c"

	data_title: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_title_kw, is_quoted] ensure Result.attr_name.same_string (data_title_kw) end
		--data-title	string - Title used when page is shown

	data_toggle: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-toggle.html"
		attribute Result := ["", "", Void, data_toggle_kw, is_quoted] ensure Result.attr_name.same_string (data_toggle_kw) end
		--data-toggle

	data_transition: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["slide", "slide|fade|none|pop", Void, data_transition_kw, is_quoted] ensure Result.attr_name.same_string (data_transition_kw) end
		--data-transition	slide | fade | none - Show/hide-transition when a tap/click occurs

	data_type: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-type.html"
		attribute Result := ["", "", Void, data_type_kw, is_quoted] ensure Result.attr_name.same_string (data_type_kw) end
		--data-type

	data_url: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_url_kw, is_quoted] ensure Result.attr_name.same_string (data_url_kw) end
		--data-url	url - Value for updating the URL, instead of the url used to request the page

	data_valid_example: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_valid_example_kw, is_quoted] ensure Result.attr_name.same_string (data_valid_example_kw) end
		--data_valid_example_kw

	data_x: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-x.html"
		attribute Result := ["", "", Void, data_x_kw, is_quoted] ensure Result.attr_name.same_string (data_x_kw) end
		--data-x

	data_y: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-y.html"
		attribute Result := ["", "", Void, data_y_kw, is_quoted] ensure Result.attr_name.same_string (data_y_kw) end
		--data-y

feature -- Setters

	set_attribute_manual (a_attr_name, a_attr_value: STRING; a_is_quoted: BOOLEAN)
		require
			not_has_attribute: not has_manually_set_attribute (a_attr_value)
		local
			l_attr: attached like attribute_tuple_anchor
		do
			l_attr := [a_attr_value, "", 0, a_attr_name, a_is_quoted]
			manually_added_attributes_list.force (l_attr, a_attr_name)
		ensure
			has: manually_added_attributes_list.has (a_attr_name)
			count: manually_added_attributes_list.count = (old manually_added_attributes_list.count + 1)
		end

	has_manually_set_attribute (a_attr_name: STRING): BOOLEAN
		require
			not_empty: not a_attr_name.is_empty
		do
			Result := manually_added_attributes_list.has (a_attr_name)
		end

	set_class_names (a_class_names: STRING)
			-- `set_class_names' of `global_class' with `a_class_names'.
		require
			valid_but_has_invalid_characters: across a_class_names as ic all ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_ ").has (ic.item) end
				-- Do not send characters other than: [a-zA-Z0-9] | '-' | '_' | ' '
			no_dot_but_has_dot: not a_class_names.has ('.')
				-- Do not pass class names with prepended "." (example: .my_class)
		do
			set_attribute_value (agent global_class, a_class_names)
		ensure
			no_dots_but_has_dots: not global_class.attr_name.has ('.')
				-- Promises to set `global_class' `attr_name' without prefix '.' characters.
		end

	set_bem_name (a_block, a_element, a_modifier: STRING)
		require
			has_block: not a_block.is_empty
		local
			l_name: STRING
		do
			create l_name.make_empty
			l_name.append_string_general (a_block)
			if not a_element.is_empty then
				l_name.append_string_general ("__")
				l_name.append_string_general (a_element)
			end
			if not a_modifier.is_empty then
				l_name.append_string_general ("--")
				l_name.append_string_general (a_modifier)
			end
			set_class_names (l_name)
		end

	append_class_name (a_class_name: STRING)
			-- `append_class_name' with `a_class_name' into `global_class'.
		require
			unique_name_but_already_has_name: not (global_class.attr_name.split (' ')).has (a_class_name)
				-- Do not try to append the same name twice to the list of classes.
		local
			l_new_name: STRING
		do
			create l_new_name.make_empty
			if attached {STRING} global_class.attr_value as al_value then
				l_new_name.append_string (al_value)
				l_new_name.append_character (' ')
			end
			l_new_name.append_string (a_class_name)
			global_class.attr_value := l_new_name
		ensure
			has_name_but_not_found: attached {STRING} global_class.attr_value as al_value and then al_value.has_substring (a_class_name)
				-- Promises to add `a_class_name' to `global_class' `attr_name'.
		end

	append_bem_name (a_block, a_element, a_modifier: STRING)
		require
			has_block: not a_block.is_empty
		local
			l_name: STRING
		do
			create l_name.make_empty
			l_name.append_string_general (a_block)
			if not a_element.is_empty then
				l_name.append_string_general ("__")
				l_name.append_string_general (a_element)
			end
			if not a_modifier.is_empty then
				l_name.append_string_general ("--")
				l_name.append_string_general (a_modifier)
			end
			append_class_name (l_name)
		end

	remove_class_name (a_name_to_remove: STRING)
			-- `remove_class_name' `a_name_to_remove' from `global_class' attr_name.
		require
			no_dot_but_has_dot: not a_name_to_remove.has ('.')
				-- Do not pass class names with prepended "." (example: .my_class)
		local
			l_reset_name: STRING
		do
			create l_reset_name.make_empty
			across
				global_class.attr_name.split (' ') as ic
			loop
				if not ic.item.same_string (a_name_to_remove) then
					l_reset_name.append_string (ic.item)
				end
			end
			set_class_names (l_reset_name)
		ensure
			removed_but_still_found: not global_class.attr_name.has_substring (a_name_to_remove)
				-- Promises to remove `a_name_to_remove' from `global_class' `attr_name'.
		end

	remove_bem_name (a_block, a_element, a_modifier: STRING)
		require
			has_block: not a_block.is_empty
		local
			l_name: STRING
		do
			create l_name.make_empty
			l_name.append_string_general (a_block)
			if not a_element.is_empty then
				l_name.append_string_general ("__")
				l_name.append_string_general (a_element)
			end
			if not a_modifier.is_empty then
				l_name.append_string_general ("--")
				l_name.append_string_general (a_modifier)
			end
			remove_class_name (l_name)
		end

	set_id (a_value: STRING)
			-- `set_id' with `a_value'.
		do
			set_attribute_value (agent global_id, a_value)
		end

feature {NONE} -- Implementation: Data Setters

	set_data_add_back_btn (a_value: STRING) do set_attribute_value (agent data_add_back_btn, a_value)
		ensure set: attached {STRING} data_add_back_btn.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_auto_init (a_value: STRING) do set_attribute_value (agent data_auto_init, a_value)
		ensure set: attached {STRING} data_auto_init.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_back_btn_text (a_value: STRING) do set_attribute_value (agent data_back_btn_text, a_value)
		ensure set: attached {STRING} data_back_btn_text.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_back_btn_theme (a_value: STRING) do set_attribute_value (agent data_back_btn_theme, a_value)
		ensure set: attached {STRING} data_back_btn_theme.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_close_btn_text (a_value: STRING) do set_attribute_value (agent data_close_btn_text, a_value)
		ensure set: attached {STRING} data_close_btn_text.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_dom_cache (a_value: STRING) do set_attribute_value (agent data_dom_cache, a_value)
		ensure set: attached {STRING} data_dom_cache.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_dismiss (a_value: STRING) do set_attribute_value (agent data_dismiss, a_value)
		ensure set: attached {STRING} data_dismiss.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_direction (a_value: STRING) do set_attribute_value (agent data_direction, a_value)
		ensure set: attached {STRING} data_direction.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_easing (a_value: STRING) do set_attribute_value (agent data_easing, a_value)
		ensure set: attached {STRING} data_easing.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_fullscreen (a_value: STRING) do set_attribute_value (agent data_fullscreen, a_value)
		ensure set: attached {STRING} data_fullscreen.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_holder_rendered (a_value: STRING) do set_attribute_value (agent data_holder_rendered, a_value)
		ensure set: attached {STRING} data_holder_rendered.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_icon (a_value: STRING) do set_attribute_value (agent data_icon, a_value)
		ensure set: attached {STRING} data_icon.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_inline (a_value: STRING) do set_attribute_value (agent data_inline, a_value)
		ensure set: attached {STRING} data_inline.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_id (a_value: STRING) do set_attribute_value (agent data_id, a_value)
		ensure set: attached {STRING} data_id.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_overlay_theme (a_value: STRING) do set_attribute_value (agent data_overlay_theme, a_value)
		ensure set: attached {STRING} data_overlay_theme.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_position (a_value: STRING) do set_attribute_value (agent data_position, a_value)
		ensure set: attached {STRING} data_position.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_ride (a_value: STRING) do set_attribute_value (agent data_ride, a_value)
		ensure set: attached {STRING} data_ride.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_rel (a_value: STRING) do set_attribute_value (agent data_rel, a_value)
		ensure set: attached {STRING} data_rel.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_role (a_value: STRING) do set_attribute_value (agent data_role, a_value)
		ensure set: attached {STRING} data_role.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_speed (a_value: STRING) do set_attribute_value (agent data_speed, a_value)
		ensure set: attached {STRING} data_speed.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_start (a_value: STRING) do set_attribute_value (agent data_start, a_value)
		ensure set: attached {STRING} data_start.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_src (a_value: STRING) do set_attribute_value (agent data_src, a_value)
		ensure set: attached {STRING} data_src.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_slide (a_value: STRING) do set_attribute_value (agent data_slide, a_value)
		ensure set: attached {STRING} data_slide.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_slide_to (a_value: STRING) do set_attribute_value (agent data_slide_to, a_value)
		ensure set: attached {STRING} data_slide_to.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_theme (a_value: STRING) do set_attribute_value (agent data_theme, a_value)
		ensure set: attached {STRING} data_theme.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_title (a_value: STRING) do set_attribute_value (agent data_title, a_value)
		ensure set: attached {STRING} data_title.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_target (a_value: STRING) do set_attribute_value (agent data_target, a_value)
		ensure set: attached {STRING} data_target.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_toggle (a_value: STRING) do set_attribute_value (agent data_toggle, a_value)
		ensure set: attached {STRING} data_toggle.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_transition (a_value: STRING) do set_attribute_value (agent data_transition, a_value)
		ensure set: attached {STRING} data_transition.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_type (a_value: STRING) do set_attribute_value (agent data_type, a_value)
		ensure set: attached {STRING} data_type.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_url (a_value: STRING) do set_attribute_value (agent data_url, a_value)
		ensure set: attached {STRING} data_url.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_valid_example (a_value: STRING) do set_attribute_value (agent data_valid_example, a_value)
		ensure set: attached {STRING} data_valid_example.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_x (a_value: STRING) do set_attribute_value (agent data_x, a_value)
		ensure set: attached {STRING} data_x.attr_value as al_value and then al_value.same_string (a_value) end

	set_data_y (a_value: STRING) do set_attribute_value (agent data_y, a_value)
		ensure set: attached {STRING} data_y.attr_value as al_value and then al_value.same_string (a_value) end

feature {NONE} -- Aria Setters

	set_aria_hidden (a_value: STRING)
			-- `set_aria_hidden' with `a_value'
		do
			set_attribute_value (agent aria_hidden, a_value)
		ensure
			set: attached {STRING} aria_hidden.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_aria_label (a_value: STRING)
			-- `set_aria_label' with `a_value'
		do
			set_attribute_value (agent aria_label, a_value)
		ensure
			set: attached {STRING} aria_label.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_aria_multiselectable (a_value: STRING)
			-- `set_aria_multiselectable' with `a_value'
		do
			set_attribute_value (agent aria_multiselectable, a_value)
		ensure
			set: attached {STRING} aria_multiselectable.attr_value as al_value and then al_value.same_string (a_value)
		end

feature {NONE} -- Implementation: Setters

	set_action (a_value: STRING)
			-- `set_action' with `a_value'
		do
			set_attribute_value (agent action, a_value)
		ensure
			set: attached {STRING} action.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_align (a_value: STRING)
			-- `set_align' with `a_value'
		do
			set_attribute_value (agent align, a_value)
		ensure
			set: attached {STRING} align.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_border (a_value: STRING)
			-- `set_border' with `a_value'
		do
			set_attribute_value (agent border, a_value)
		ensure
			set: attached {STRING} border.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_content (a_value: STRING)
			-- `set_content' with `a_value'
		do
			set_attribute_value (agent content, a_value)
		ensure
			set: attached {STRING} content.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_contenteditable (a_value: STRING)
			-- `set_contenteditable' with `a_value'
		do
			set_attribute_value (agent contenteditable, a_value)
		ensure
			set: attached {STRING} contenteditable.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_crossorigin (a_value: STRING)
			-- `set_crossorigin' with `a_value'
		do
			set_attribute_value (agent crossorigin, a_value)
		ensure
			set: attached {STRING} crossorigin.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_valign (a_value: STRING)
			-- `set_valign' with `a_value'
		do
			set_attribute_value (agent valign, a_value)
		ensure
			set: attached {STRING} valign.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_alt (a_value: STRING)
			-- `set_alt' with `a_value'
		do
			set_attribute_value (agent alt, a_value)
		ensure
			set: attached {STRING} alt.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_autocomplete (a_value: STRING)
			-- `set_alt' with `a_value'
		do
			set_attribute_value (agent autocomplete, a_value)
		ensure
			set: attached {STRING} autocomplete.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_cols (a_value: STRING)
			-- `set_cols' with `a_value'
		do
			set_attribute_value (agent cols, a_value)
		ensure
			set: attached {STRING} cols.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_colspan (a_value: STRING)
			-- `set_colspan' with `a_value'
		do
			set_attribute_value (agent colspan, a_value)
		ensure
			set: attached {STRING} colspan.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_cell_spacing (a_value: STRING)
			-- `set_cell_spacing' with `a_cell_spacing'
		do
			set_attribute_value (agent cell_spacing, a_value)
		ensure
			set: attached {STRING} cell_spacing.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_cell_padding (a_value: STRING)
			-- `set_cell_padding' with `a_value'
		do
			set_attribute_value (agent cell_padding, a_value)
		ensure
			set: attached {STRING} cell_padding.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_charset (a_value: STRING)
			-- `set_cell_padding' with `a_value'
		do
			set_attribute_value (agent charset, a_value)
		ensure
			set: attached {STRING} charset.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_for (a_value: STRING)
			-- `set_for' with `a_value'.
		do
			set_attribute_value (agent for, a_value)
		ensure
			set: attached {STRING} for.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_frameborder (a_value: STRING)
			-- `set_frameborder' with `a_value'.
		do
			set_attribute_value (agent frameborder, a_value)
		ensure
			set: attached {STRING} frameborder.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_height (a_value: STRING)
			-- `set_height' with `a_value'.
		do
			set_attribute_value (agent height, a_value)
		end

	set_height_width (a_height, a_width: STRING)
			-- `set_height_width' with `a_height' and `a_width'.
		do
			set_height (a_height)
			set_width (a_width)
		end

	set_href (a_value: STRING)
			-- `set_href' with `a_value'.
		do
			set_attribute_value (agent href, a_value)
		end

	set_hreflang (a_value: STRING)
			-- `set_href' with `a_value'.
		do
			set_attribute_value (agent hreflang, a_value)
		end

	set_html_equiv (a_value: STRING)
			-- `set_html_equiv' with `a_value'.
		do
			set_attribute_value (agent html_equiv, a_value)
		end

	set_itemscope (a_value: STRING)
			-- `set_itemscope' with `a_value'.
		do
			set_attribute_value (agent itemscope, a_value)
		end

	set_itemtype (a_value: STRING)
			-- `set_itemtype' with `a_value'.
		do
			set_attribute_value (agent itemtype, a_value)
		end

	set_lang (a_value: STRING)
			-- `set_lang' with `a_value'
		do
			set_attribute_value (agent lang, a_value)
		ensure
			set: attached {STRING} lang.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_maxlength (a_value: STRING)
			-- `set_maxlength' with `a_value'
		do
			set_attribute_value (agent maxlength, a_value)
		ensure
			set: attached {STRING} maxlength.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_media (a_value: STRING)
			-- `set_method' with `a_method'
		do
			set_attribute_value (agent media, a_value)
		ensure
			set: attached {STRING} media.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_method (a_value: STRING)
			-- `set_method' with `a_value'
		do
			set_attribute_value (agent method, a_value)
		ensure
			set: attached {STRING} method.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_name (a_value: STRING)
			-- `set_name' with `a_value'
		do
			set_attribute_value (agent name, a_value)
		ensure
			set: attached {STRING} name.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_on_click (a_value: STRING)
			-- `set_on_click' with `a_value'.
		do
			set_attribute_value (agent on_click, a_value)
		ensure
			set: attached {STRING} on_click.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_on_focus (a_value: STRING)
			-- `set_on_focus' with `a_value'.
		do
			set_attribute_value (agent on_focus, a_value)
		ensure
			set: attached {STRING} on_focus.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_on_submit (a_value: STRING)
			-- `set_on_submit' with `a_value'.
		do
			set_attribute_value (agent on_submit, a_value)
		ensure
			set: attached {STRING} on_submit.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_pattern (a_value: STRING)
			-- `set_pattern' with `a_value'
		do
			set_attribute_value (agent pattern, a_value)
		ensure
			set: attached {STRING} pattern.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_placeholder (a_value: STRING)
			-- `set_placeholder' with `a_value'
		do
			set_attribute_value (agent placeholder, a_value)
		ensure
			set: attached {STRING} placeholder.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_property (a_value: STRING)
			-- `set_property' with `a_value'
		do
			set_attribute_value (agent property, a_value)
		ensure
			set: attached {STRING} property.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_role (a_value: STRING)
			-- `set_role' with `a_value'
		do
			set_attribute_value (agent role, a_value)
		ensure
			set: attached {STRING} role.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_rows (a_value: STRING)
			-- `set_rows' with `a_value'
		do
			set_attribute_value (agent rows, a_value)
		ensure
			set: attached {STRING} rows.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_rowspan (a_value: STRING)
			-- `set_rowspan' with `a_value'
		do
			set_attribute_value (agent rowspan, a_value)
		ensure
			set: attached {STRING} rowspan.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_rel (a_value: STRING)
			-- `set_rel' with `a_value'.
		do
			set_attribute_value (agent rel, a_value)
		end

	set_size (a_value: STRING)
			-- `set_size' with `a_value'
		do
			set_attribute_value (agent size, a_value)
		ensure
			set: attached {STRING} size.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_sizes (a_value: STRING)
			-- `set_sizes' with `a_value'
		do
			set_attribute_value (agent sizes, a_value)
		ensure
			set: attached {STRING} sizes.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_source,
	set_src (a_value: STRING)
			-- `set_source' (aka `set_src') with `a_value'.
		do
			set_attribute_value (agent src, a_value)
		end

	set_status (a_value: STRING)
			-- `set_status' with `a_value'
		do
			set_attribute_value (agent status, a_value)
		ensure
			set: attached {STRING} status.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_style (a_value: STRING)
			-- `set_style' with `a_value'
		do
			set_attribute_value (agent style, a_value)
		ensure
			set: attached {STRING} style.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_target (a_value: STRING)
			-- `set_target' with `a_value'
		do
			set_attribute_value (agent target, a_value)
		ensure
			set: attached {STRING} target.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_title (a_value: STRING)
			-- `set_title' with `a_value'
		do
			set_attribute_value (agent title, a_value)
		ensure
			set: attached {STRING} title.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_type (a_value: STRING)
			-- `set_type' with `a_value'
		do
			set_attribute_value (agent type, a_value)
		ensure
			set: attached {STRING} type.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_value (a_value: STRING)
			-- `set_value' with `a_value'
		do
			set_attribute_value (agent value, a_value)
		ensure
			set: attached {STRING} value.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_width (a_value: STRING)
			-- `set_width' with `a_value'.
		do
			set_attribute_value (agent width, a_value)
		end

	set_wrap (a_value: STRING)
			-- `set_wrap' with `a_value'
		do
			set_attribute_value (agent wrap, a_value)
		ensure
			set: attached {STRING} wrap.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_xml_lang (a_value: STRING)
			-- `set_xml_lang' with `a_value'
		do
			set_attribute_value (agent xml_lang, a_value)
		ensure
			set: attached {STRING} xml_lang.attr_value as al_value and then al_value.same_string (a_value)
		end

	set_xmlns (a_value: STRING)
			-- `set_xmlns' with `a_value'
		do
			set_attribute_value (agent xmlns, a_value)
		ensure
			set: attached {STRING} xmlns.attr_value as al_value and then al_value.same_string (a_value)
		end

feature {NONE} -- Attribute List

	attribute_list: HASH_TABLE [attached like attribute_tuple_anchor, STRING]
		do
			Result := core_attribute_list.twin
			across
				manually_added_attributes_list as ic
			loop
				Result.force (ic.item, ic.key)
			end
		end

	manually_added_attributes_list: like attribute_list
		attribute
			create Result.make (10)
		end
			-- <Precursor>
			-- HTML attributes for <table>
	core_attribute_list: HASH_TABLE [TUPLE [attr_value: detachable ANY; attr_default: detachable ANY; attr_minimum: detachable NUMERIC; attr_name: STRING_8; is_quoted: BOOLEAN], STRING]
		do
				-- Global
			create Result.make (Default_capacity)
			Result.force (global_accesskey, global_accesskey.attr_name)
			Result.force (global_class, global_class.attr_name)
			Result.force (global_id, global_id.attr_name)
			Result.force (global_style, global_style.attr_name)

				-- Aria
			Result.force (aria_hidden, aria_hidden.attr_name)
			Result.force (aria_label, aria_label.attr_name)
			Result.force (aria_multiselectable, aria_multiselectable.attr_name)

				-- Common
			Result.force (action, action.attr_name)
			Result.force (align, align.attr_name)
			Result.force (valign, valign.attr_name)
			Result.force (alt, alt.attr_name)
			Result.force (autocomplete, autocomplete.attr_name)
			Result.force (border, border.attr_name)
			Result.force (cell_spacing, cell_spacing.attr_name)
			Result.force (cell_padding, cell_padding.attr_name)
			Result.force (charset, charset.attr_name)
			Result.force (cols, cols.attr_name)
			Result.force (colspan, colspan.attr_name)
			Result.force (content, content.attr_name)
			Result.force (contenteditable, contenteditable.attr_name)
			Result.force (crossorigin, crossorigin.attr_name)
			Result.force (for, for.attr_name)
			Result.force (frameborder, frameborder.attr_name)
			Result.force (height, height.attr_name)
			Result.force (href, href.attr_name)
			Result.force (hreflang, hreflang.attr_name)
			Result.force (html_equiv, html_equiv.attr_name)
			Result.force (itemscope, itemscope.attr_name)
			Result.force (itemtype, itemtype.attr_name)
			Result.force (lang, lang.attr_name)
			Result.force (maxlength, maxlength.attr_name)
			Result.force (media, media.attr_name)
			Result.force (method, method.attr_name)
			Result.force (name, name.attr_name)
			Result.force (pattern, pattern.attr_name)
			Result.force (placeholder, placeholder.attr_name)
			Result.force (property, property.attr_name)
			Result.force (rel, rel.attr_name)
			Result.force (role, role.attr_name)
			Result.force (rows, rows.attr_name)
			Result.force (rowspan, rowspan.attr_name)
			Result.force (size, size.attr_name)
			Result.force (sizes, sizes.attr_name)
			Result.force (src, src.attr_name)
			Result.force (status, status.attr_name)
			Result.force (style, style.attr_name)
			Result.force (target, target.attr_name)
			Result.force (title, title.attr_name)
			Result.force (type, type.attr_name)
			Result.force (value, value.attr_name)
			Result.force (width, width.attr_name)
			Result.force (wrap, wrap.attr_name)
			Result.force (xml_lang, xml_lang.attr_name)
			Result.force (xmlns, xmlns.attr_name)

				-- Datums
			Result.force (data_add_back_btn, data_add_back_btn.attr_name)
			Result.force (data_auto_init, data_auto_init.attr_name)
			Result.force (data_back_btn_text, data_back_btn_text.attr_name)
			Result.force (data_back_btn_theme, data_back_btn_theme.attr_name)
			Result.force (data_close_btn_text, data_close_btn_text.attr_name)
			Result.force (data_dismiss, data_dismiss.attr_name)
			Result.force (data_dom_cache, data_dom_cache.attr_name)
			Result.force (data_easing, data_easing.attr_name)
			Result.force (data_fullscreen, data_fullscreen.attr_name)
			Result.force (data_holder_rendered, data_holder_rendered.attr_name)
			Result.force (data_icon, data_icon.attr_name)
			Result.force (data_id, data_id.attr_name)
			Result.force (data_inline, data_inline.attr_name)
			Result.force (data_overlay_theme, data_overlay_theme.attr_name)
			Result.force (data_position, data_position.attr_name)
			Result.force (data_rel, data_rel.attr_name)
			Result.force (data_ride, data_ride.attr_name)
			Result.force (data_role, data_role.attr_name)
			Result.force (data_slide, data_slide.attr_name)
			Result.force (data_slide_to, data_slide_to.attr_name)
			Result.force (data_speed, data_speed.attr_name)
			Result.force (data_src, data_src.attr_name)
			Result.force (data_start, data_start.attr_name)
			Result.force (data_target, data_target.attr_name)
			Result.force (data_theme, data_theme.attr_name)
			Result.force (data_title, data_title.attr_name)
			Result.force (data_toggle, data_toggle.attr_name)
			Result.force (data_transition, data_transition.attr_name)
			Result.force (data_type, data_type.attr_name)
			Result.force (data_url, data_url.attr_name)
			Result.force (data_valid_example, data_valid_example.attr_name)
			Result.force (data_x, data_x.attr_name)
			Result.force (data_y, data_y.attr_name)

				-- Events
			Result.force (on_after_print, on_after_print.attr_name)
			Result.force (on_before_print, on_before_print.attr_name)
			Result.force (on_before_unload, on_before_unload.attr_name)
			Result.force (on_error, on_error.attr_name)
			Result.force (on_hash_change, on_hash_change.attr_name)
			Result.force (on_load, on_load.attr_name)
			Result.force (on_message, on_message.attr_name)
			Result.force (on_offline, on_offline.attr_name)
			Result.force (on_online, on_online.attr_name)
			Result.force (on_page_hide, on_page_hide.attr_name)
			Result.force (on_page_show, on_page_show.attr_name)
			Result.force (on_pop_state, on_pop_state.attr_name)
			Result.force (on_resize, on_resize.attr_name)
			Result.force (on_storage, on_storage.attr_name)
			Result.force (on_unload, on_unload.attr_name)

				-- Form Events
			Result.force (on_blur, on_blur.attr_name)
			Result.force (on_change, on_change.attr_name)
			Result.force (on_context_menu, on_context_menu.attr_name)
			Result.force (on_focus, on_focus.attr_name)
			Result.force (on_input, on_input.attr_name)
			Result.force (on_invalid, on_invalid.attr_name)
			Result.force (on_reset, on_reset.attr_name)
			Result.force (on_search, on_search.attr_name)
			Result.force (on_select, on_select.attr_name)
			Result.force (on_submit, on_submit.attr_name)

				-- Keyboard Events
			Result.force (on_key_down, on_key_down.attr_name)
			Result.force (on_key_press, on_key_press.attr_name)
			Result.force (on_key_up, on_key_up.attr_name)

				-- Mouse Events
			Result.force (on_click, on_click.attr_name)
			Result.force (on_dbl_click, on_dbl_click.attr_name)
			Result.force (on_drag_end, on_drag_end.attr_name)
			Result.force (on_drag_enter, on_drag_enter.attr_name)
			Result.force (on_drag_leave, on_drag_leave.attr_name)
			Result.force (on_drag_over, on_drag_over.attr_name)
			Result.force (on_drag_start, on_drag_start.attr_name)
			Result.force (on_drop, on_drop.attr_name)
			Result.force (on_mouse_down, on_mouse_down.attr_name)
			Result.force (on_mouse_move, on_mouse_move.attr_name)
			Result.force (on_mouse_out, on_mouse_out.attr_name)
			Result.force (on_mouse_over, on_mouse_over.attr_name)
			Result.force (on_mouse_up, on_mouse_up.attr_name)
			Result.force (on_mouse_wheel, on_mouse_wheel.attr_name)
			Result.force (on_scroll, on_scroll.attr_name)
			Result.force (on_wheel, on_wheel.attr_name)

				-- Clipboard Events
			Result.force (on_copy, on_copy.attr_name)
			Result.force (on_cut, on_cut.attr_name)
			Result.force (on_paste, on_paste.attr_name)

				-- Media Events
			Result.force (on_abort, on_abort.attr_name)
			Result.force (on_can_play, on_can_play.attr_name)
			Result.force (on_can_play_through, on_can_play_through.attr_name)
			Result.force (on_cue_change, on_cue_change.attr_name)
			Result.force (on_duration_change, on_duration_change.attr_name)
			Result.force (on_emptied, on_emptied.attr_name)
			Result.force (on_ended, on_ended.attr_name)
			Result.force (on_loaded_data, on_loaded_data.attr_name)
			Result.force (on_loaded_meta_data, on_loaded_meta_data.attr_name)
			Result.force (on_load_start, on_load_start.attr_name)
			Result.force (on_pause, on_pause.attr_name)
			Result.force (on_play, on_play.attr_name)
			Result.force (on_playing, on_playing.attr_name)
			Result.force (on_progress, on_progress.attr_name)
			Result.force (on_rate_change, on_rate_change.attr_name)
			Result.force (on_seeked, on_seeked.attr_name)
			Result.force (on_seeking, on_seeking.attr_name)
			Result.force (on_stalled, on_stalled.attr_name)
			Result.force (on_suspend, on_suspend.attr_name)
			Result.force (on_time_update, on_time_update.attr_name)
			Result.force (on_volume_change, on_volume_change.attr_name)
			Result.force (on_waiting, on_waiting.attr_name)
		ensure then
			count: Result.count >= Default_capacity
		end

feature {NONE} -- Constants

	attribute_separator: STRING = "  "
	no_value: STRING = ""
	no_default: STRING = ""
	no_minimum: detachable NUMERIC once Result := Void end

feature -- Constants

	Default_capacity: INTEGER
		attribute Result := 6 end

end
