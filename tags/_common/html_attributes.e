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

class
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

feature -- Global Attributes

	global_accesskey: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_global_accesskey.asp"
		attribute Result := ["", "", Void, accesskey_kw, is_quoted] ensure Result.attr_name.same_string (accesskey_kw) end
	accesskey_kw: STRING = "accesskey"

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
	class_kw: STRING = "class"

	global_id: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_global_id.asp"
				example: "id=%"my_id_thing%""
				description: "[
					The id attribute specifies a unique id for an HTML element (the value 
					must be unique within the HTML document).
					]"
		attribute Result := ["", "", Void, id_kw, is_quoted] ensure Result.attr_name.same_string (id_kw) end
	id_kw: STRING = "id"

	global_style: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_global_style.asp"
		attribute Result := ["", "", Void, style_kw, is_quoted] ensure Result.attr_name.same_string (style_kw) end
	style_kw: STRING = "style"

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
	action_kw: STRING = "action"

	border_attribute: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_table_border.asp"
		attribute Result := ["0", "0", Void, border_kw, is_quoted] ensure Result.attr_name.same_string (border_kw) end
	border_kw: STRING = "border"

	cols: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_cols.asp"
		attribute Result := ["", "", Void, cols_kw, is_quoted] ensure Result.attr_name.same_string (cols_kw) end
	cols_kw: STRING = "cols"

	for: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_for.asp"
		attribute Result := ["", "", Void, for_kw, is_quoted] ensure Result.attr_name.same_string (for_kw) end
	for_kw: STRING = "height"

	height: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_height.asp"
		attribute Result := ["", "", Void, height_kw, is_quoted] ensure Result.attr_name.same_string (height_kw) end
	height_kw: STRING = "height"

	href: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_a_href.asp"
		attribute Result := ["", "", Void, href_kw, is_quoted] ensure Result.attr_name.same_string (href_kw) end
	href_kw: STRING = "href"

	method: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_method.asp"
		attribute Result := ["", "", Void, method_kw, is_quoted] ensure Result.attr_name.same_string (method_kw) end
	method_kw: STRING = "method"

	maxlength: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_maxlength.asp"
		attribute Result := ["", "", Void, maxlength_kw, is_quoted] ensure Result.attr_name.same_string (maxlength_kw) end
	maxlength_kw: STRING = "maxlength"

	name: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_name.asp"
		attribute Result := ["", "", Void, name_kw, is_quoted] ensure Result.attr_name.same_string (name_kw) end
	name_kw: STRING = "name"

	rel: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_rel.asp"
		attribute Result := ["", "", Void, rel_kw, is_quoted] ensure Result.attr_name.same_string (rel_kw) end
	rel_kw: STRING = "rel"

	role: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_role.asp"
		attribute Result := ["", "", Void, role_kw, is_quoted] ensure Result.attr_name.same_string (role_kw) end
	role_kw: STRING = "role"

	rows: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_role.asp"
		attribute Result := ["", "", Void, rows_kw, is_quoted] ensure Result.attr_name.same_string (rows_kw) end
	rows_kw: STRING = "rows"

	size: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_rows.asp"
		attribute Result := ["", "", Void, size_kw, is_quoted] ensure Result.attr_name.same_string (size_kw) end
	size_kw: STRING = "size"
	no_size: INTEGER = 0


	src, source: attached like attribute_tuple_anchor
		note EIS: "srcattribute //www.w3schools.com/tags/attr_src.asp"
		attribute Result := ["", "", Void, src_kw, is_quoted] ensure Result.attr_name.same_string (src_kw) end
	src_kw: STRING = "src"

	type: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_type.asp"
		attribute Result := ["", "", Void, "type", is_quoted] ensure Result.attr_name.same_string (type_kw) end
	type_kw: STRING = "type"

	value: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_value.asp"
		attribute Result := ["", "", Void, value_kw, is_quoted] ensure Result.attr_name.same_string (value_kw) end
	value_kw: STRING = "value"

	width: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_width.asp"
		attribute Result := ["", "", Void, width_kw, is_quoted] ensure Result.attr_name.same_string (width_kw) end
	width_kw: STRING = "width"
	width_values: STRING = "soft|hard|physical"

	wrap: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_textarea_wrap.asp"
		attribute Result := ["", "", Void, wrap_kw, is_quoted] ensure Result.attr_name.same_string (wrap_kw) end
	wrap_kw: STRING = "wrap"

feature -- Attributes: Global Events

	on_after_print: attached like attribute_tuple_anchor
			--onafterprint	script	Script to be run after the document is printed
		attribute Result := ["", "", Void, onafterprint_kw, is_quoted] ensure Result.attr_name.same_string (onafterprint_kw) end
	onafterprint_kw: STRING = "onafterprint"

	on_before_print: attached like attribute_tuple_anchor
			--onbeforeprint	script	Script to be run before the document is printed
		attribute Result := ["", "", Void, onbeforeprint_kw, is_quoted] ensure Result.attr_name.same_string (onbeforeprint_kw) end
	onbeforeprint_kw: STRING = "onbeforeprint"

	on_before_unload: attached like attribute_tuple_anchor
			-- `on_before_unload'	script	Script to be run when the document is about to be unloaded
		attribute Result := ["", "", Void, onbeforeunload_kw, is_quoted] ensure Result.attr_name.same_string (onbeforeunload_kw) end
	onbeforeunload_kw: STRING = "onbeforeunload"

	on_error: attached like attribute_tuple_anchor
			--`on_error'			script	Script to be run when an error occurs
		attribute Result := ["", "", Void, onerror_kw, is_quoted] ensure Result.attr_name.same_string (onerror_kw) end
	onerror_kw: STRING = "onerror"

	on_hash_change: attached like attribute_tuple_anchor
			--`on_hash_change'	script	Script to be run when there has been changes to the anchor part of the a URL
		attribute Result := ["", "", Void, onhashchange_kw, is_quoted] ensure Result.attr_name.same_string (onhashchange_kw) end
	onhashchange_kw: STRING = "onhashchange"

	on_load: attached like attribute_tuple_anchor
			--`on_load'			script	Fires after the page is finished loading
		attribute Result := ["", "", Void, onload_kw, is_quoted] ensure Result.attr_name.same_string (onload_kw) end
	onload_kw: STRING = "onload"

	on_message: attached like attribute_tuple_anchor
			--`on_message'		script	Script to be run when the message is triggered
		attribute Result := ["", "", Void, onmessage_kw, is_quoted] ensure Result.attr_name.same_string (onmessage_kw) end
	onmessage_kw: STRING = "onmessage"

	on_offline: attached like attribute_tuple_anchor
			--`on_offline'		script	Script to be run when the browser starts to work offline
		attribute Result := ["", "", Void, onoffline_kw, is_quoted] ensure Result.attr_name.same_string (onoffline_kw) end
	onoffline_kw: STRING = "onoffline"

	on_online: attached like attribute_tuple_anchor
			--`on_online'		script	Script to be run when the browser starts to work online
		attribute Result := ["", "", Void, ononline_kw, is_quoted] ensure Result.attr_name.same_string (ononline_kw) end
	ononline_kw: STRING = "ononline"

	on_page_hide: attached like attribute_tuple_anchor
			--`on_page_hide'		script	Script to be run when a user navigates away from a page
		attribute Result := ["", "", Void, onpagehide_kw, is_quoted] ensure Result.attr_name.same_string (onpagehide_kw) end
	onpagehide_kw: STRING = "onpagehide"

	on_page_show: attached like attribute_tuple_anchor
			--`on_page_show'		script	Script to be run when a user navigates to a page
		attribute Result := ["", "", Void, onpageshow_kw, is_quoted] ensure Result.attr_name.same_string (onpageshow_kw) end
	onpageshow_kw: STRING = "onpageshow"

	on_pop_state: attached like attribute_tuple_anchor
			--`on_pop_state'		script	Script to be run when the window's history changes
		attribute Result := ["", "", Void, onpopstate_kw, is_quoted] ensure Result.attr_name.same_string (onpopstate_kw) end
	onpopstate_kw: STRING = "onpopstate"

	on_resize: attached like attribute_tuple_anchor
			--`on_resize'		script	Fires when the browser window is resized
		attribute Result := ["", "", Void, onresize_kw, is_quoted] ensure Result.attr_name.same_string (onresize_kw) end
	onresize_kw: STRING = "onresize"

	on_storage: attached like attribute_tuple_anchor
			--`on_storage'		script	Script to be run when a Web Storage area is updated
		attribute Result := ["", "", Void, onstorage_kw, is_quoted] ensure Result.attr_name.same_string (onstorage_kw) end
	onstorage_kw: STRING = "onstorage"

	on_unload: attached like attribute_tuple_anchor
			--`on_unload'		script	Fires once a page has unloaded (or the browser window has been closed)
		attribute Result := ["", "", Void, onunload_kw, is_quoted] ensure Result.attr_name.same_string (onunload_kw) end
	onunload_kw: STRING = "onunload"

feature {NONE} -- Attributes: Form Events

	on_blur: attached like attribute_tuple_anchor
			--`on_blur'			script	Fires the moment that the element loses focus
		attribute Result := ["", "", Void, onblur_kw, is_quoted] ensure Result.attr_name.same_string (onblur_kw) end
	onblur_kw: STRING = "onblur"

	on_change: attached like attribute_tuple_anchor
			--`on_change'		script	Fires the moment when the value of the element is changed
		attribute Result := ["", "", Void, onchange_kw, is_quoted] ensure Result.attr_name.same_string (onchange_kw) end
	onchange_kw: STRING = "onchange"

	on_context_menu: attached like attribute_tuple_anchor
			--`on_context_menu'	script	Script to be run when a context menu is triggered
		attribute Result := ["", "", Void, oncontextmenu_kw, is_quoted] ensure Result.attr_name.same_string (oncontextmenu_kw) end
	oncontextmenu_kw: STRING = "oncontextmenu"

	on_focus: attached like attribute_tuple_anchor
			--`on_focus'			script	Fires the moment when the element gets focus
		attribute Result := ["", "", Void, onfocus_kw, is_quoted] ensure Result.attr_name.same_string (onfocus_kw) end
	onfocus_kw: STRING = "onfocus"

	on_input: attached like attribute_tuple_anchor
			--`on_input'			script	Script to be run when an element gets user input
		attribute Result := ["", "", Void, oninput_kw, is_quoted] ensure Result.attr_name.same_string (oninput_kw) end
	oninput_kw: STRING = "oninput"

	on_invalid: attached like attribute_tuple_anchor
			--`on_invalid'		script	Script to be run when an element is invalid
		attribute Result := ["", "", Void, oninvalid_kw, is_quoted] ensure Result.attr_name.same_string (oninvalid_kw) end
	oninvalid_kw: STRING = "oninvalid"

	on_reset: attached like attribute_tuple_anchor
			--`on_reset'			script	Fires when the Reset button in a form is clicked
		attribute Result := ["", "", Void, onreset_kw, is_quoted] ensure Result.attr_name.same_string (onreset_kw) end
	onreset_kw: STRING = "onreset"

	on_search: attached like attribute_tuple_anchor
			--`on_search'		script	Fires when the user writes something in a search field (for <input="search">)
		attribute Result := ["", "", Void, onsearch_kw, is_quoted] ensure Result.attr_name.same_string (onsearch_kw) end
	onsearch_kw: STRING = "onsearch"

	on_select: attached like attribute_tuple_anchor
			--`on_select'		script	Fires after some text has been selected in an element
		attribute Result := ["", "", Void, onselect_kw, is_quoted] ensure Result.attr_name.same_string (onselect_kw) end
	onselect_kw: STRING = "onselect"

	on_submit: attached like attribute_tuple_anchor
			--`on_submit'		script	Fires when a form is submitted
		attribute Result := ["", "", Void, onsubmit_kw, is_quoted] ensure Result.attr_name.same_string (onsubmit_kw) end
	onsubmit_kw: STRING = "onsubmit"

feature {NONE} -- Attributes: Keyboard Events

	on_key_down: attached like attribute_tuple_anchor
			--`on_key_down'	script	Fires when a user is pressing a key
		attribute Result := ["", "", Void, onkeydown_kw, is_quoted] ensure Result.attr_name.same_string (onkeydown_kw) end
	onkeydown_kw: STRING = "onkeydown"

	on_key_press: attached like attribute_tuple_anchor
			--`on_key_press'	script	Fires when a user presses a key
		attribute Result := ["", "", Void, onkeypress_kw, is_quoted] ensure Result.attr_name.same_string (onkeypress_kw) end
	onkeypress_kw: STRING = "onkeypress"

	on_key_up: attached like attribute_tuple_anchor
			--`on_key_up'	script	Fires when a user releases a key
		attribute Result := ["", "", Void, onkeyup_kw, is_quoted] ensure Result.attr_name.same_string (onkeyup_kw) end
	onkeyup_kw: STRING = "onkeyup"

feature {NONE} -- Attributes: Mouse Events

	on_click: attached like attribute_tuple_anchor
			--`onclick'	script	Fires on a mouse click on the element
		attribute Result := ["", "", Void, onclick_kw, is_quoted] ensure Result.attr_name.same_string (onclick_kw) end
	onclick_kw: STRING = "onclick"

	on_dbl_click: attached like attribute_tuple_anchor
			--`on_dbl_click'	script	Fires on a mouse double-click on the element
		attribute Result := ["", "", Void, ondblclick_kw, is_quoted] ensure Result.attr_name.same_string (ondblclick_kw) end
	ondblclick_kw: STRING = "ondblclick"

	on_drag: attached like attribute_tuple_anchor
			--`on_drag'	script	Script to be run when an element is dragged
		attribute Result := ["", "", Void, ondrag_kw, is_quoted] ensure Result.attr_name.same_string (ondrag_kw) end
	ondrag_kw: STRING = "ondrag"

	on_drag_end: attached like attribute_tuple_anchor
			--`on_drag_end'	script	Script to be run at the end of a drag operation
		attribute Result := ["", "", Void, ondragend_kw, is_quoted] ensure Result.attr_name.same_string (ondragend_kw) end
	ondragend_kw: STRING = "ondragend"

	on_drag_enter: attached like attribute_tuple_anchor
			--`on_drag_enter'	script	Script to be run when an element has been dragged to a valid drop target
		attribute Result := ["", "", Void, ondragenter_kw, is_quoted] ensure Result.attr_name.same_string (ondragenter_kw) end
	ondragenter_kw: STRING = "ondragenter"

	on_drag_leave: attached like attribute_tuple_anchor
			--`on_drag_leave'	script	Script to be run when an element leaves a valid drop target
		attribute Result := ["", "", Void, ondragleave_kw, is_quoted] ensure Result.attr_name.same_string (ondragleave_kw) end
	ondragleave_kw: STRING = "ondragleave"

	on_drag_over: attached like attribute_tuple_anchor
			--`on_drag_over'	script	Script to be run when an element is being dragged over a valid drop target
		attribute Result := ["", "", Void, ondragover_kw, is_quoted] ensure Result.attr_name.same_string (ondragover_kw) end
	ondragover_kw: STRING = "ondragover"

	on_drag_start: attached like attribute_tuple_anchor
			--`on_drag_start'	script	Script to be run at the start of a drag operation
		attribute Result := ["", "", Void, ondragstart_kw, is_quoted] ensure Result.attr_name.same_string (ondragstart_kw) end
	ondragstart_kw: STRING = "ondragstart"

	on_drop: attached like attribute_tuple_anchor
			--`on_drop'	script	Script to be run when dragged element is being dropped
		attribute Result := ["", "", Void, ondrop_kw, is_quoted] ensure Result.attr_name.same_string (ondrop_kw) end
	ondrop_kw: STRING = "ondrop"

	on_mouse_down: attached like attribute_tuple_anchor
			--`on_mouse_down'	script	Fires when a mouse button is pressed down on an element
		attribute Result := ["", "", Void, onmousedown_kw, is_quoted] ensure Result.attr_name.same_string (onmousedown_kw) end
	onmousedown_kw: STRING = "onmousedown"

	on_mouse_move: attached like attribute_tuple_anchor
			--`on_mouse_move'	script	Fires when the mouse pointer is moving while it is over an element
		attribute Result := ["", "", Void, onmousemove_kw, is_quoted] ensure Result.attr_name.same_string (onmousemove_kw) end
	onmousemove_kw: STRING = "onmousemove"

	on_mouse_out: attached like attribute_tuple_anchor
			--`on_mouse_out'	script	Fires when the mouse pointer moves out of an element
		attribute Result := ["", "", Void, onmouseout_kw, is_quoted] ensure Result.attr_name.same_string (onmouseout_kw) end
	onmouseout_kw: STRING = "onmouseout"

	on_mouse_over: attached like attribute_tuple_anchor
			--`on_mouse_over'	script	Fires when the mouse pointer moves over an element
		attribute Result := ["", "", Void, onmouseover_kw, is_quoted] ensure Result.attr_name.same_string (onmouseover_kw) end
	onmouseover_kw: STRING = "onmouseover"

	on_mouse_up: attached like attribute_tuple_anchor
			--`on_mouse_up'	script	Fires when a mouse button is released over an element
		attribute Result := ["", "", Void, onmouseup_kw, is_quoted] ensure Result.attr_name.same_string (onmouseup_kw) end
	onmouseup_kw: STRING = "onmouseup"

	on_mouse_wheel: attached like attribute_tuple_anchor
			--`on_mouse_wheel'	script	Deprecated. Use the onwheel attribute instead
		obsolete "use on_wheel instead." attribute Result := ["", "", Void, onmousewheel_kw, is_quoted] ensure Result.attr_name.same_string (onmousewheel_kw) end
	onmousewheel_kw: STRING = "onmousewheel"

	on_scroll: attached like attribute_tuple_anchor
			--`on_scroll'	script	Script to be run when an element's scrollbar is being scrolled
		attribute Result := ["", "", Void, onscroll_kw, is_quoted] ensure Result.attr_name.same_string (onscroll_kw) end
	onscroll_kw: STRING = "onscroll"

	on_wheel: attached like attribute_tuple_anchor
			--`on_wheel'	script	Fires when the mouse wheel rolls up or down over an element
		attribute Result := ["", "", Void, onwheel_kw, is_quoted] ensure Result.attr_name.same_string (onwheel_kw) end
	onwheel_kw: STRING = "onwheel"

feature {NONE} -- Attributes: Clipboard Events

	on_copy: attached like attribute_tuple_anchor
			--`on_copy'	script	Fires when the user copies the content of an element
		attribute Result := ["", "", Void, oncopy_kw, is_quoted] ensure Result.attr_name.same_string (oncopy_kw) end
	oncopy_kw: STRING = "oncopy"

	on_cut: attached like attribute_tuple_anchor
			--`on_cut'	script	Fires when the user cuts the content of an element
		attribute Result := ["", "", Void, oncut_kw, is_quoted] ensure Result.attr_name.same_string (oncut_kw) end
	oncut_kw: STRING = "oncut"

	on_paste: attached like attribute_tuple_anchor
			--`on_paste'	script	Fires when the user pastes some content in an element
		attribute Result := ["", "", Void, onpaste_kw, is_quoted] ensure Result.attr_name.same_string (onpaste_kw) end
	onpaste_kw: STRING = "onpaste"

feature {NONE} -- Attributes: Media Events

	on_abort: attached like attribute_tuple_anchor
			--`on_abort'	script	Script to be run on abort
		attribute Result := ["", "", Void, onabort_kw, is_quoted] ensure Result.attr_name.same_string (onabort_kw) end
	onabort_kw: STRING = "onabort"

	on_can_play: attached like attribute_tuple_anchor
			--`on_can_play'	script	Script to be run when a file is ready to start playing (when it has buffered enough to begin)
		attribute Result := ["", "", Void, oncanplay_kw, is_quoted] ensure Result.attr_name.same_string (oncanplay_kw) end
	oncanplay_kw: STRING = "oncanplay"

	on_can_play_through: attached like attribute_tuple_anchor
			--`on_can_play_through'	script	Script to be run when a file can be played all the way to the end without pausing for buffering
		attribute Result := ["", "", Void, oncanplaythrough_kw, is_quoted] ensure Result.attr_name.same_string (oncanplaythrough_kw) end
	oncanplaythrough_kw: STRING = "oncanplaythrough"

	on_cue_change: attached like attribute_tuple_anchor
			--`on_cue_change'	script	Script to be run when the cue changes in a <track> element
		attribute Result := ["", "", Void, oncuechange_kw, is_quoted] ensure Result.attr_name.same_string (oncuechange_kw) end
	oncuechange_kw: STRING = "oncuechange"

	on_duration_change: attached like attribute_tuple_anchor
			--`on_duration_change'	script	Script to be run when the length of the media changes
		attribute Result := ["", "", Void, ondurationchange_kw, is_quoted] ensure Result.attr_name.same_string (ondurationchange_kw) end
	ondurationchange_kw: STRING = "ondurationchange"

	on_emptied: attached like attribute_tuple_anchor
			--`on_emptied'	script	Script to be run when something bad happens and the file is suddenly unavailable (like unexpectedly disconnects)
		attribute Result := ["", "", Void, onemptied_kw, is_quoted] ensure Result.attr_name.same_string (onemptied_kw) end
	onemptied_kw: STRING = "onemptied"

	on_ended: attached like attribute_tuple_anchor
			--`on_ended'	script	Script to be run when the media has reach the end (a useful event for messages like "thanks for listening")
		attribute Result := ["", "", Void, onended_kw, is_quoted] ensure Result.attr_name.same_string (onended_kw) end
	onended_kw: STRING = "onended"

	on_loaded_data: attached like attribute_tuple_anchor
			--`on_loaded_data'	script	Script to be run when media data is loaded
		attribute Result := ["", "", Void, onloadeddata_kw, is_quoted] ensure Result.attr_name.same_string (onloadeddata_kw) end
	onloadeddata_kw: STRING = "onloadeddata"

	on_loaded_meta_data: attached like attribute_tuple_anchor
			--`on_loaded_meta_data'	script	Script to be run when meta data (like dimensions and duration) are loaded
		attribute Result := ["", "", Void, onloadedmetadata_kw, is_quoted] ensure Result.attr_name.same_string (onloadedmetadata_kw) end
	onloadedmetadata_kw: STRING = "onloadedmetadata"

	on_load_start: attached like attribute_tuple_anchor
			--`on_load_start'	script	Script to be run just as the file begins to load before anything is actually loaded
		attribute Result := ["", "", Void, onloadstart_kw, is_quoted] ensure Result.attr_name.same_string (onloadstart_kw) end
	onloadstart_kw: STRING = "onloadstart"

	on_pause: attached like attribute_tuple_anchor
			--`on_pause'	script	Script to be run when the media is paused either by the user or programmatically
		attribute Result := ["", "", Void, onpause_kw, is_quoted] ensure Result.attr_name.same_string (onpause_kw) end
	onpause_kw: STRING = "onpause"

	on_play: attached like attribute_tuple_anchor
			--`on_play'	script	Script to be run when the media is ready to start playing
		attribute Result := ["", "", Void, onplay_kw, is_quoted] ensure Result.attr_name.same_string (onplay_kw) end
	onplay_kw: STRING = "onplay"

	on_playing: attached like attribute_tuple_anchor
			--`on_playing'	script	Script to be run when the media actually has started playing
		attribute Result := ["", "", Void, onplaying_kw, is_quoted] ensure Result.attr_name.same_string (onplaying_kw) end
	onplaying_kw: STRING = "onplaying"

	on_progress: attached like attribute_tuple_anchor
			--`on_progress'	script	Script to be run when the browser is in the process of getting the media data
		attribute Result := ["", "", Void, onprogress_kw, is_quoted] ensure Result.attr_name.same_string (onprogress_kw) end
	onprogress_kw: STRING = "onprogress"

	on_rate_change: attached like attribute_tuple_anchor
			--`on_rate_change'	script	Script to be run each time the playback rate changes (like when a user switches to a slow motion or fast forward mode)
		attribute Result := ["", "", Void, onratechange_kw, is_quoted] ensure Result.attr_name.same_string (onratechange_kw) end
	onratechange_kw: STRING = "onratechange"

	on_seeked: attached like attribute_tuple_anchor
			--`on_seeked'	script	Script to be run when the seeking attribute is set to false indicating that seeking has ended
		attribute Result := ["", "", Void, onseeked_kw, is_quoted] ensure Result.attr_name.same_string (onseeked_kw) end
	onseeked_kw: STRING = "onseeked"

	on_seeking: attached like attribute_tuple_anchor
			--`on_seeking'	script	Script to be run when the seeking attribute is set to true indicating that seeking is active
		attribute Result := ["", "", Void, onseeking_kw, is_quoted] ensure Result.attr_name.same_string (onseeking_kw) end
	onseeking_kw: STRING = "onseeking"

	on_stalled: attached like attribute_tuple_anchor
			--`on_stalled'	script	Script to be run when the browser is unable to fetch the media data for whatever reason
		attribute Result := ["", "", Void, onstalled_kw, is_quoted] ensure Result.attr_name.same_string (onstalled_kw) end
	onstalled_kw: STRING = "onstalled"

	on_suspend: attached like attribute_tuple_anchor
			--`on_suspend'	script	Script to be run when fetching the media data is stopped before it is completely loaded for whatever reason
		attribute Result := ["", "", Void, onsuspend_kw, is_quoted] ensure Result.attr_name.same_string (onsuspend_kw) end
	onsuspend_kw: STRING = "onsuspend"

	on_time_update: attached like attribute_tuple_anchor
			--`on_time_update'	script	Script to be run when the playing position has changed (like when the user fast forwards to a different point in the media)
		attribute Result := ["", "", Void, ontimeupdate_kw, is_quoted] ensure Result.attr_name.same_string (ontimeupdate_kw) end
	ontimeupdate_kw: STRING = "ontimeupdate"

	on_volume_change: attached like attribute_tuple_anchor
			--`on_volume_change'	script	Script to be run each time the volume is changed which (includes setting the volume to "mute")
		attribute Result := ["", "", Void, onvolumechange_kw, is_quoted] ensure Result.attr_name.same_string (onvolumechange_kw) end
	onvolumechange_kw: STRING = "onvolumechange"

	on_waiting: attached like attribute_tuple_anchor
			--`on_waiting'	script	Script to be run when the media has paused but is expected to resume (like when the media pauses to buffer more data)
		attribute Result := ["", "", Void, onwaiting_kw, is_quoted] ensure Result.attr_name.same_string (onwaiting_kw) end
	onwaiting_kw: STRING = "onwaiting"

feature {NONE} -- Attributes: Datums

	data_role: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_role_kw, is_quoted] ensure Result.attr_name.same_string (data_role_kw) end
	data_role_kw: STRING = "data-role"
		--data-role

	data_theme: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_theme_kw, is_quoted] ensure Result.attr_name.same_string (data_theme_kw) end
	data_theme_kw: STRING = "data-theme"
		--data-theme	swatch letter (a-z) - Default "c"

	data_id: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_id_kw, is_quoted] ensure Result.attr_name.same_string (data_id_kw) end
	data_id_kw: STRING = "data-id"
		--data-id	string - Unique ID. Required for persistent headers

	data_position: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_position_kw, is_unquoted] ensure Result.attr_name.same_string (data_position_kw) end
	data_position_kw: STRING = "data-position"
		--data-position	fixed

	data_fullscreen: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["false", "false|true", Void, data_fullscreen_kw, is_quoted] ensure Result.attr_name.same_string (data_fullscreen_kw) end
	data_fullscreen_kw: STRING = "data-fullscreen"
		--data-fullscreen	true | false - Used in conjunction with fixed toolbars

	data_add_back_btn: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["false", "false|true", Void, data_add_back_btn_kw, is_quoted] ensure Result.attr_name.same_string (data_add_back_btn_kw) end
	data_add_back_btn_kw: STRING = "data-add-back-btn"
		--data-add-back-btn	true | false - Auto add back button, header only

	data_back_btn_text: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_back_btn_text_kw, is_quoted] ensure Result.attr_name.same_string (data_back_btn_text_kw) end
	data_back_btn_text_kw: STRING = "data-back-btn-text"
		--data-back-btn-text	string

	data_back_btn_theme: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, dat_back_btn_theme_kw, is_quoted] ensure Result.attr_name.same_string (dat_back_btn_theme_kw) end
	dat_back_btn_theme_kw: STRING = "data-back-btn-theme"
		--data-back-btn-theme	swatch letter (a-z)

	data_close_btn_text: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_close_btn_text_kw, is_quoted] ensure Result.attr_name.same_string (data_close_btn_text_kw) end
	data_close_btn_text_kw: STRING = "data-close-btn-text"
		--data-close-btn-text	string - Text for the close button, dialog only

	data_dom_cache: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["false", "false|true", Void, data_dom_cache_kw, is_quoted] ensure Result.attr_name.same_string (data_dom_cache_kw) end
	data_dom_cache_kw: STRING = "data-dom-cache"
		--data-dom-cache	true | false

	data_overlay_theme: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_overlay_theme_kw, is_quoted] ensure Result.attr_name.same_string (data_overlay_theme_kw) end
	data_overlay_theme_kw: STRING = "data-overlay-theme"
		--data-overlay-theme	swatch letter (a-z) - Overlay theme when the page is opened in a dialog

	data_title: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_title_kw, is_quoted] ensure Result.attr_name.same_string (data_title_kw) end
	data_title_kw: STRING = "data-title"
		--data-title	string - Title used when page is shown

	data_url: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_url_kw, is_quoted] ensure Result.attr_name.same_string (data_url_kw) end
	data_url_kw: STRING = "data-url"
		--data-url	url - Value for updating the URL, instead of the url used to request the page

	data_transition: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["slide", "slide|fade|none|pop", Void, data_transition_kw, is_quoted] ensure Result.attr_name.same_string (data_transition_kw) end
	data_transition_kw: STRING = "data-transition"
		--data-transition	slide | fade | none - Show/hide-transition when a tap/click occurs

	data_rel: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["back", "back|dialog|external|popup", Void, data_rel_kw, is_quoted] ensure Result.attr_name.same_string (data_rel_kw) end
	data_rel_kw: STRING = "data-rel"
		--data-rel	back - To move one step back in history
		--dialog - To open link styled as dialog, not tracked in history
		--external - For linking to another domain
		--popup - For opening a popup

	data_direction: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, data_direction_kw, is_quoted] ensure Result.attr_name.same_string (data_direction_kw) end
	data_direction_kw: STRING = "data-direction"
		--data-direction	reverse - Reverse transition animation (only for page or dialog)

	data_icon: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["home", "home|delete|plus|arrow-u|arrow-d|check|gear|grid|star|custom|arrow-r|arrow-l|minus|refresh|forward|back|alert|info|search", Void, data_icon_kw, is_quoted] ensure Result.attr_name.same_string (data_icon_kw) end
	data_icon_kw: STRING = "data-icon"
		-- data-icon	home | delete | plus | arrow-u | arrow-d | check | gear | grid | star | custom | arrow-r | arrow-l | minus | refresh | forward | back | alert | info | search

	data_inline: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["false", "false|true", Void, data_inline_kw, is_quoted] ensure Result.attr_name.same_string (data_inline_kw) end
	data_inline_kw: STRING = "data-inline"
		--data-inline	true | false - Auto add back button, header only

feature -- Setters

	set_class (a_class_names: STRING)
			-- `set_class' of `global_class' with `a_class_names'.
		do
			set_attribute_value (agent global_class, a_class_names)
		end

	set_id (a_value: STRING)
			-- `set_id' with `a_value'.
		do
			set_attribute_value (agent global_id, a_value)
		end

feature {NONE} -- Implementation: Setters

	set_cols (a_cols: STRING)
			-- `set_cols' with `a_cols'
		do
			set_attribute_value (agent cols, a_cols)
		ensure
			set: attached {STRING} cols.attr_value as al_value and then al_value.same_string (a_cols)
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

	set_maxlength (a_maxlength: STRING)
			-- `set_maxlength' with `a_maxlength'
		do
			set_attribute_value (agent maxlength, a_maxlength)
		ensure
			set: attached {STRING} maxlength.attr_value as al_value and then al_value.same_string (a_maxlength)
		end

	set_method (a_method: STRING)
			-- `set_method' with `a_method'
		do
			set_attribute_value (agent method, a_method)
		ensure
			set: attached {STRING} method.attr_value as al_value and then al_value.same_string (a_method)
		end

	set_name (a_name: STRING)
			-- `set_name' with `a_name'
		do
			set_attribute_value (agent name, a_name)
		ensure
			set: attached {STRING} name.attr_value as al_value and then al_value.same_string (a_name)
		end

	set_on_click (a_value: STRING)
			-- `set_on_click' with `a_value'.
		do
			set_attribute_value (agent on_click, a_value)
		end

	set_rows (a_rows: STRING)
			-- `set_rows' with `a_rows'
		do
			set_attribute_value (agent rows, a_rows)
		ensure
			set: attached {STRING} rows.attr_value as al_value and then al_value.same_string (a_rows)
		end

	set_rel (a_value: STRING)
			-- `set_rel' with `a_value'.
		do
			set_attribute_value (agent rel, a_value)
		end

	set_size (a_size: STRING)
			-- `set_size' with `a_size'
		do
			set_attribute_value (agent size, a_size)
		ensure
			set: attached {STRING} size.attr_value as al_value and then al_value.same_string (a_size)
		end

	set_source,
	set_src (a_value: STRING)
			-- `set_source' (aka `set_src') with `a_value'.
		do
			set_attribute_value (agent src, a_value)
		end

	set_type (a_type: STRING)
			-- `set_type' with `a_type'
		do
			set_attribute_value (agent type, a_type)
		ensure
			set: attached {STRING} type.attr_value as al_value and then al_value.same_string (a_type)
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

	set_wrap (a_wrap: STRING)
			-- `set_wrap' with `a_wrap'
		do
			set_attribute_value (agent wrap, a_wrap)
		ensure
			set: attached {STRING} wrap.attr_value as al_value and then al_value.same_string (a_wrap)
		end

feature {NONE} -- Attribute List

	attribute_list: HASH_TABLE [attached like attribute_tuple_anchor, STRING]
			-- <Precursor>
			-- HTML attributes for <table>
		do
				-- Global
			create Result.make (Default_capacity)
			Result.force (global_accesskey, global_accesskey.attr_name)
			Result.force (global_class, global_class.attr_name)
			Result.force (global_id, global_id.attr_name)
			Result.force (global_style, global_style.attr_name)

				-- Common
			Result.force (action, action.attr_name)
			Result.force (border_attribute, border_attribute.attr_name)
			Result.force (cols, cols.attr_name)
			Result.force (for, for.attr_name)
			Result.force (height, height.attr_name)
			Result.force (href, href.attr_name)
			Result.force (maxlength, maxlength.attr_name)
			Result.force (method, method.attr_name)
			Result.force (name, name.attr_name)
			Result.force (rel, rel.attr_name)
			Result.force (role, role.attr_name)
			Result.force (rows, rows.attr_name)
			Result.force (size, size.attr_name)
			Result.force (src, src.attr_name)
			Result.force (type, type.attr_name)
			Result.force (value, value.attr_name)
			Result.force (width, width.attr_name)
			Result.force (wrap, wrap.attr_name)

				-- Datums
			Result.force (data_role, data_role.attr_name)
			Result.force (data_theme, data_theme.attr_name)
			Result.force (data_id, data_id.attr_name)
			Result.force (data_position, data_position.attr_name)
			Result.force (data_fullscreen, data_fullscreen.attr_name)
			Result.force (data_add_back_btn, data_add_back_btn.attr_name)
			Result.force (data_back_btn_text, data_back_btn_text.attr_name)
			Result.force (data_back_btn_theme, data_back_btn_theme.attr_name)
			Result.force (data_close_btn_text, data_close_btn_text.attr_name)
			Result.force (data_dom_cache, data_dom_cache.attr_name)
			Result.force (data_overlay_theme, data_overlay_theme.attr_name)
			Result.force (data_title, data_title.attr_name)
			Result.force (data_url, data_url.attr_name)
			Result.force (data_transition, data_transition.attr_name)
			Result.force (data_rel, data_rel.attr_name)
			Result.force (data_icon, data_icon.attr_name)
			Result.force (data_inline, data_inline.attr_name)

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

feature -- Constants

	Default_capacity: INTEGER
		once ("object") Result := 6 end

end
