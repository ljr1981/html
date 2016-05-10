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
		attribute Result := ["", "", Void, "accesskey", is_quoted] end
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
		attribute Result := ["", "", Void, "class", is_quoted] end
	global_id: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_global_id.asp"
				example: "id=%"my_id_thing%""
				description: "[
					The id attribute specifies a unique id for an HTML element (the value 
					must be unique within the HTML document).
					]"
		attribute Result := ["", "", Void, "id", is_quoted] end
	global_style: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_global_style.asp"
		attribute Result := ["", "", Void, "style", is_quoted] end

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
		attribute Result := ["", "", Void, "action", is_quoted] end

	border_attribute: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_table_border.asp"
		attribute Result := ["0", "0", Void, "border", is_quoted] end

	for: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_for.asp"
		attribute Result := ["", "", Void, "height", is_quoted] end

	height: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_height.asp"
		attribute Result := ["", "", Void, "for", is_quoted] end

	href: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_a_href.asp"
		attribute Result := ["", "", Void, "href", is_quoted] end

	name: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_name.asp"
		attribute Result := ["", "", Void, "name", is_quoted] end

	rel: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_rel.asp"
		attribute Result := ["", "", Void, "rel", is_quoted] end

	role: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_role.asp"
		attribute Result := ["", "", Void, "role", is_quoted] end

	src: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_src.asp"
		attribute Result := ["", "", Void, "src", is_quoted] end

	type: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/attr_type.asp"
		attribute Result := ["", "", Void, "type", is_quoted] end

	width: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/width.asp"
		attribute Result := ["", "", Void, "width", is_quoted] end

feature -- Attributes: Global Events

	on_after_print: attached like attribute_tuple_anchor
			--onafterprint	script	Script to be run after the document is printed
		attribute Result := ["", "", Void, "onafterprint", is_quoted] end

	on_before_print: attached like attribute_tuple_anchor
			--onbeforeprint	script	Script to be run before the document is printed
		attribute Result := ["", "", Void, "onbeforeprint", is_quoted] end

	on_before_unload: attached like attribute_tuple_anchor
			-- `on_before_unload'	script	Script to be run when the document is about to be unloaded
		attribute Result := ["", "", Void, "onbeforeunload", is_quoted] end

	on_error: attached like attribute_tuple_anchor
			--`on_error'			script	Script to be run when an error occurs
		attribute Result := ["", "", Void, "onerror", is_quoted] end

	on_hash_change: attached like attribute_tuple_anchor
			--`on_hash_change'	script	Script to be run when there has been changes to the anchor part of the a URL
		attribute Result := ["", "", Void, "onhashchange", is_quoted] end

	on_load: attached like attribute_tuple_anchor
			--`on_load'			script	Fires after the page is finished loading
		attribute Result := ["", "", Void, "onload", is_quoted] end

	on_message: attached like attribute_tuple_anchor
			--`on_message'		script	Script to be run when the message is triggered
		attribute Result := ["", "", Void, "onmessage", is_quoted] end

	on_offline: attached like attribute_tuple_anchor
			--`on_offline'		script	Script to be run when the browser starts to work offline
		attribute Result := ["", "", Void, "onoffline", is_quoted] end

	on_online: attached like attribute_tuple_anchor
			--`on_online'		script	Script to be run when the browser starts to work online
		attribute Result := ["", "", Void, "ononline", is_quoted] end

	on_page_hide: attached like attribute_tuple_anchor
			--`on_page_hide'		script	Script to be run when a user navigates away from a page
		attribute Result := ["", "", Void, "onpagehide", is_quoted] end

	on_page_show: attached like attribute_tuple_anchor
			--`on_page_show'		script	Script to be run when a user navigates to a page
		attribute Result := ["", "", Void, "onpageshow", is_quoted] end

	on_pop_state: attached like attribute_tuple_anchor
			--`on_pop_state'		script	Script to be run when the window's history changes
		attribute Result := ["", "", Void, "onpopstate", is_quoted] end

	on_resize: attached like attribute_tuple_anchor
			--`on_resize'		script	Fires when the browser window is resized
		attribute Result := ["", "", Void, "onresize", is_quoted] end

	on_storage: attached like attribute_tuple_anchor
			--`on_storage'		script	Script to be run when a Web Storage area is updated
		attribute Result := ["", "", Void, "onstorage", is_quoted] end

	on_unload: attached like attribute_tuple_anchor
			--`on_unload'		script	Fires once a page has unloaded (or the browser window has been closed)
		attribute Result := ["", "", Void, "onunload", is_quoted] end

feature -- Attributes: Form Events

	on_blur: attached like attribute_tuple_anchor
			--`on_blur'			script	Fires the moment that the element loses focus
		attribute Result := ["", "", Void, "onblur", is_quoted] end

	on_change: attached like attribute_tuple_anchor
			--`on_change'		script	Fires the moment when the value of the element is changed
		attribute Result := ["", "", Void, "onchange", is_quoted] end

	on_context_menu: attached like attribute_tuple_anchor
			--`on_context_menu'	script	Script to be run when a context menu is triggered
		attribute Result := ["", "", Void, "oncontextmenu", is_quoted] end

	on_focus: attached like attribute_tuple_anchor
			--`on_focus'			script	Fires the moment when the element gets focus
		attribute Result := ["", "", Void, "onfocus", is_quoted] end

	on_input: attached like attribute_tuple_anchor
			--`on_input'			script	Script to be run when an element gets user input
		attribute Result := ["", "", Void, "oninput", is_quoted] end

	on_invalid: attached like attribute_tuple_anchor
			--`on_invalid'		script	Script to be run when an element is invalid
		attribute Result := ["", "", Void, "oninvalid", is_quoted] end

	on_reset: attached like attribute_tuple_anchor
			--`on_reset'			script	Fires when the Reset button in a form is clicked
		attribute Result := ["", "", Void, "onreset", is_quoted] end

	on_search: attached like attribute_tuple_anchor
			--`on_search'		script	Fires when the user writes something in a search field (for <input="search">)
		attribute Result := ["", "", Void, "onsearch", is_quoted] end

	on_select: attached like attribute_tuple_anchor
			--`on_select'		script	Fires after some text has been selected in an element
		attribute Result := ["", "", Void, "onselect", is_quoted] end

	on_submit: attached like attribute_tuple_anchor
			--`on_submit'		script	Fires when a form is submitted
		attribute Result := ["", "", Void, "onsubmit", is_quoted] end

feature -- Attributes: Keyboard Events

	on_key_down: attached like attribute_tuple_anchor
			--`on_key_down'	script	Fires when a user is pressing a key
		attribute Result := ["", "", Void, "onkeydown", is_quoted] end

	on_key_press: attached like attribute_tuple_anchor
			--`on_key_press'	script	Fires when a user presses a key
		attribute Result := ["", "", Void, "onkeypress", is_quoted] end

	on_key_up: attached like attribute_tuple_anchor
			--`on_key_up'	script	Fires when a user releases a key
		attribute Result := ["", "", Void, "onkeyup", is_quoted] end

feature -- Attributes: Mouse Events

	on_click: attached like attribute_tuple_anchor
			--`onclick'	script	Fires on a mouse click on the element
		attribute Result := ["", "", Void, "onclick", is_quoted] end

	on_dbl_click: attached like attribute_tuple_anchor
			--`on_dbl_click'	script	Fires on a mouse double-click on the element
		attribute Result := ["", "", Void, "ondblclick", is_quoted] end

	on_drag: attached like attribute_tuple_anchor
			--`on_drag'	script	Script to be run when an element is dragged
		attribute Result := ["", "", Void, "ondrag", is_quoted] end

	on_drag_end: attached like attribute_tuple_anchor
			--`on_drag_end'	script	Script to be run at the end of a drag operation
		attribute Result := ["", "", Void, "ondragend", is_quoted] end

	on_drag_enter: attached like attribute_tuple_anchor
			--`on_drag_enter'	script	Script to be run when an element has been dragged to a valid drop target
		attribute Result := ["", "", Void, "ondragenter", is_quoted] end

	on_drag_leave: attached like attribute_tuple_anchor
			--`on_drag_leave'	script	Script to be run when an element leaves a valid drop target
		attribute Result := ["", "", Void, "ondragleave", is_quoted] end

	on_drag_over: attached like attribute_tuple_anchor
			--`on_drag_over'	script	Script to be run when an element is being dragged over a valid drop target
		attribute Result := ["", "", Void, "ondragover", is_quoted] end

	on_drag_start: attached like attribute_tuple_anchor
			--`on_drag_start'	script	Script to be run at the start of a drag operation
		attribute Result := ["", "", Void, "ondragstart", is_quoted] end

	on_drop: attached like attribute_tuple_anchor
			--`on_drop'	script	Script to be run when dragged element is being dropped
		attribute Result := ["", "", Void, "ondrop", is_quoted] end

	on_mouse_down: attached like attribute_tuple_anchor
			--`on_mouse_down'	script	Fires when a mouse button is pressed down on an element
		attribute Result := ["", "", Void, "onmousedown", is_quoted] end

	on_mouse_move: attached like attribute_tuple_anchor
			--`on_mouse_move'	script	Fires when the mouse pointer is moving while it is over an element
		attribute Result := ["", "", Void, "onmousemove", is_quoted] end

	on_mouse_out: attached like attribute_tuple_anchor
			--`on_mouse_out'	script	Fires when the mouse pointer moves out of an element
		attribute Result := ["", "", Void, "onmouseout", is_quoted] end

	on_mouse_over: attached like attribute_tuple_anchor
			--`on_mouse_over'	script	Fires when the mouse pointer moves over an element
		attribute Result := ["", "", Void, "onmouseover", is_quoted] end

	on_mouse_up: attached like attribute_tuple_anchor
			--`on_mouse_up'	script	Fires when a mouse button is released over an element
		attribute Result := ["", "", Void, "onmouseup", is_quoted] end

	on_mouse_wheel: attached like attribute_tuple_anchor
			--`on_mouse_wheel'	script	Deprecated. Use the onwheel attribute instead
		obsolete "use on_wheel instead." attribute Result := ["", "", Void, "onmousewheel", is_quoted] end

	on_scroll: attached like attribute_tuple_anchor
			--`on_scroll'	script	Script to be run when an element's scrollbar is being scrolled
		attribute Result := ["", "", Void, "onscroll", is_quoted] end

	on_wheel: attached like attribute_tuple_anchor
			--`on_wheel'	script	Fires when the mouse wheel rolls up or down over an element
		attribute Result := ["", "", Void, "onwheel", is_quoted] end

feature -- Attributes: Clipboard Events

	on_copy: attached like attribute_tuple_anchor
			--`on_copy'	script	Fires when the user copies the content of an element
		attribute Result := ["", "", Void, "oncopy", is_quoted] end

	on_cut: attached like attribute_tuple_anchor
			--`on_cut'	script	Fires when the user cuts the content of an element
		attribute Result := ["", "", Void, "oncut", is_quoted] end

	on_paste: attached like attribute_tuple_anchor
			--`on_paste'	script	Fires when the user pastes some content in an element
		attribute Result := ["", "", Void, "onpaste", is_quoted] end

feature -- Attributes: Media Events

	on_abort: attached like attribute_tuple_anchor
			--`on_abort'	script	Script to be run on abort
		attribute Result := ["", "", Void, "onabort", is_quoted] end

	on_can_play: attached like attribute_tuple_anchor
			--`on_can_play'	script	Script to be run when a file is ready to start playing (when it has buffered enough to begin)
		attribute Result := ["", "", Void, "oncanplay", is_quoted] end

	on_can_play_through: attached like attribute_tuple_anchor
			--`on_can_play_through'	script	Script to be run when a file can be played all the way to the end without pausing for buffering
		attribute Result := ["", "", Void, "oncanplaythrough", is_quoted] end

	on_cue_change: attached like attribute_tuple_anchor
			--`on_cue_change'	script	Script to be run when the cue changes in a <track> element
		attribute Result := ["", "", Void, "oncuechange", is_quoted] end

	on_duration_change: attached like attribute_tuple_anchor
			--`on_duration_change'	script	Script to be run when the length of the media changes
		attribute Result := ["", "", Void, "ondurationchange", is_quoted] end

	on_emptied: attached like attribute_tuple_anchor
			--`on_emptied'	script	Script to be run when something bad happens and the file is suddenly unavailable (like unexpectedly disconnects)
		attribute Result := ["", "", Void, "onemptied", is_quoted] end

	on_ended: attached like attribute_tuple_anchor
			--`on_ended'	script	Script to be run when the media has reach the end (a useful event for messages like "thanks for listening")
		attribute Result := ["", "", Void, "onended", is_quoted] end

	on_loaded_data: attached like attribute_tuple_anchor
			--`on_loaded_data'	script	Script to be run when media data is loaded
		attribute Result := ["", "", Void, "onloadeddata", is_quoted] end

	on_loaded_meta_data: attached like attribute_tuple_anchor
			--`on_loaded_meta_data'	script	Script to be run when meta data (like dimensions and duration) are loaded
		attribute Result := ["", "", Void, "onloadedmetadata", is_quoted] end

	on_load_start: attached like attribute_tuple_anchor
			--`on_load_start'	script	Script to be run just as the file begins to load before anything is actually loaded
		attribute Result := ["", "", Void, "onloadstart", is_quoted] end

	on_pause: attached like attribute_tuple_anchor
			--`on_pause'	script	Script to be run when the media is paused either by the user or programmatically
		attribute Result := ["", "", Void, "onpause", is_quoted] end

	on_play: attached like attribute_tuple_anchor
			--`on_play'	script	Script to be run when the media is ready to start playing
		attribute Result := ["", "", Void, "onplay", is_quoted] end

	on_playing: attached like attribute_tuple_anchor
			--`on_playing'	script	Script to be run when the media actually has started playing
		attribute Result := ["", "", Void, "onplaying", is_quoted] end

	on_progress: attached like attribute_tuple_anchor
			--`on_progress'	script	Script to be run when the browser is in the process of getting the media data
		attribute Result := ["", "", Void, "onprogress", is_quoted] end

	on_rate_change: attached like attribute_tuple_anchor
			--`on_rate_change'	script	Script to be run each time the playback rate changes (like when a user switches to a slow motion or fast forward mode)
		attribute Result := ["", "", Void, "onratechange", is_quoted] end

	on_seeked: attached like attribute_tuple_anchor
			--`on_seeked'	script	Script to be run when the seeking attribute is set to false indicating that seeking has ended
		attribute Result := ["", "", Void, "onseeked", is_quoted] end

	on_seeking: attached like attribute_tuple_anchor
			--`on_seeking'	script	Script to be run when the seeking attribute is set to true indicating that seeking is active
		attribute Result := ["", "", Void, "onseeking", is_quoted] end

	on_stalled: attached like attribute_tuple_anchor
			--`on_stalled'	script	Script to be run when the browser is unable to fetch the media data for whatever reason
		attribute Result := ["", "", Void, "onstalled", is_quoted] end

	on_suspend: attached like attribute_tuple_anchor
			--`on_suspend'	script	Script to be run when fetching the media data is stopped before it is completely loaded for whatever reason
		attribute Result := ["", "", Void, "onsuspend", is_quoted] end

	on_time_update: attached like attribute_tuple_anchor
			--`on_time_update'	script	Script to be run when the playing position has changed (like when the user fast forwards to a different point in the media)
		attribute Result := ["", "", Void, "ontimeupdate", is_quoted] end

	on_volume_change: attached like attribute_tuple_anchor
			--`on_volume_change'	script	Script to be run each time the volume is changed which (includes setting the volume to "mute")
		attribute Result := ["", "", Void, "onvolumechange", is_quoted] end

	on_waiting: attached like attribute_tuple_anchor
			--`on_waiting'	script	Script to be run when the media has paused but is expected to resume (like when the media pauses to buffer more data)
		attribute Result := ["", "", Void, "onwaiting", is_quoted] end

feature -- Attributes: Datums

	data_role: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, "data-role", is_quoted] end

	data_theme: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, "data-theme", is_quoted] end
		--data-theme	swatch letter (a-z) - Default "c"

	data_id: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, "data-id", is_quoted] end
		--data-id	string - Unique ID. Required for persistent headers

	data_position: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, "data-position", is_unquoted] end
		--data-position	fixed

	data_fullscreen: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["false", "false|true", Void, "data-fullscreen", is_quoted] end
		--data-fullscreen	true | false - Used in conjunction with fixed toolbars

	data_add_back_btn: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["false", "false|true", Void, "data-add-back-btn", is_quoted] end
		--data-add-back-btn	true | false - Auto add back button, header only

	data_back_btn_text: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, "data-back-btn-text", is_quoted] end
		--data-back-btn-text	string

	data_back_btn_theme: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, "data-back-btn-theme", is_quoted] end
		--data-back-btn-theme	swatch letter (a-z)

	data_close_btn_text: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, "data-close-btn-text", is_quoted] end
		--data-close-btn-text	string - Text for the close button, dialog only

	data_dom_cache: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["false", "false|true", Void, "data-dom-cache", is_quoted] end
		--data-dom-cache	true | false

	data_overlay_theme: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, "data-overlay-theme", is_quoted] end
		--data-overlay-theme	swatch letter (a-z) - Overlay theme when the page is opened in a dialog

	data_title: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, "data-title", is_quoted] end
		--data-title	string - Title used when page is shown

	data_url: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, "data-url", is_quoted] end
		--data-url	url - Value for updating the URL, instead of the url used to request the page

	data_transition: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["slide", "slide|fade|none|pop", Void, "data-transition", is_quoted] end
		--data-transition	slide | fade | none - Show/hide-transition when a tap/click occurs

	data_rel: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["back", "back|dialog|external|popup", Void, "data-rel", is_quoted] end
		--data-rel	back - To move one step back in history
		--dialog - To open link styled as dialog, not tracked in history
		--external - For linking to another domain
		--popup - For opening a popup

	data_direction: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["", "", Void, "data-direction", is_quoted] end
		--data-direction	reverse - Reverse transition animation (only for page or dialog)

	data_icon: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["home", "home|delete|plus|arrow-u|arrow-d|check|gear|grid|star|custom|arrow-r|arrow-l|minus|refresh|forward|back|alert|info|search", Void, "data-icon", is_quoted] end
		-- data-icon	home | delete | plus | arrow-u | arrow-d | check | gear | grid | star | custom | arrow-r | arrow-l | minus | refresh | forward | back | alert | info | search

	data_inline: attached like attribute_tuple_anchor
		note EIS: "src=http://demos.jquerymobile.com/1.2.0/docs/api/data-attributes.html"
		attribute Result := ["false", "false|true", Void, "data-inline", is_quoted] end
		--data-inline	true | false - Auto add back button, header only

feature -- Attribute List

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
			Result.force (for, for.attr_name)
			Result.force (href, href.attr_name)
			Result.force (name, name.attr_name)
			Result.force (role, role.attr_name)
			Result.force (src, src.attr_name)
			Result.force (height, height.attr_name)
			Result.force (width, width.attr_name)
			Result.force (rel, rel.attr_name)
			Result.force (type, type.attr_name)

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

feature -- Constants

	Default_capacity: INTEGER
		once ("object") Result := 6 end

	attribute_separator: STRING = "  "

end
