note
	description: "[
		Representation of {HTML} Constants.
		]"

class
	HTML

feature -- CSS Constants

	quoted,inquotes: BOOLEAN = True
	unquoted,noquotes: BOOLEAN = False

	noValue: detachable STRING once Result := Void end
	noExtCSS: detachable STRING once Result := Void end
	noSelectors: detachable STRING once Result := Void end

	CSSisInline: BOOLEAN = True
	CSSnotInline: BOOLEAN = False

feature -- Keywords

	accesskey_kw: STRING = "accesskey"
	action_kw: STRING = "action"
	align_kw: STRING = "align"
	alt_kw: STRING = "alt"
	aria_hidden_kw: STRING = "aria-hidden"
	aria_label_kw: STRING = "aria-label"
	aria_multiselectable_kw: STRING = "aria-multiselectable"
	autocomplete_kw: STRING = "autocomplete"
	border_kw: STRING = "border"
	cell_padding_kw: STRING = "cellpadding"
	cell_spacing_kw: STRING = "cellspacing"
	charset_kw: STRING = "charset"
	class_kw: STRING = "class"
	cols_kw: STRING = "cols"
	colspan_kw: STRING = "colspan"
	content_kw: STRING = "content"
	contenteditable_kw: STRING = "contenteditable"
	dat_back_btn_theme_kw: STRING = "data-back-btn-theme"
	data_add_back_btn_kw: STRING = "data-add-back-btn"
	data_auto_init_kw: STRING = "data-autoinit"
	data_back_btn_text_kw: STRING = "data-back-btn-text"
	data_close_btn_text_kw: STRING = "data-close-btn-text"
	data_direction_kw: STRING = "data-direction"
	data_dismiss_kw: STRING = "data-dismiss"
	data_dom_cache_kw: STRING = "data-dom-cache"
	data_easing_kw: STRING = "data-easing"
	data_fullscreen_kw: STRING = "data-fullscreen"
	data_holder_rendered_kw: STRING = "data-holder-rendered"
	data_icon_kw: STRING = "data-icon"
	data_id_kw: STRING = "data-id"
	data_inline_kw: STRING = "data-inline"
	data_overlay_theme_kw: STRING = "data-overlay-theme"
	data_position_kw: STRING = "data-position"
	data_rel_kw: STRING = "data-rel"
	data_ride_kw: STRING = "data-ride"
	data_role_kw: STRING = "data-role"
	data_slide_kw: STRING = "data-slide"
	data_slide_to_kw: STRING = "data-slide-to"
	data_speed_kw: STRING = "data-speed"
	data_src_kw: STRING = "data-src"
	data_start_kw: STRING = "data-start"
	data_target_kw: STRING = "data-target"
	data_theme_kw: STRING = "data-theme"
	data_title_kw: STRING = "data-title"
	data_toggle_kw: STRING = "data-toggle"
	data_transition_kw: STRING = "data-transition"
	data_type_kw: STRING = "data-type"
	data_url_kw: STRING = "data-url"
	data_valid_example_kw: STRING = "data-valid-example"
	data_x_kw: STRING = "data-x"
	data_y_kw: STRING = "data-y"
	for_kw: STRING = "height"
	frameborder_kw: STRING = "frameborder"
	height_kw: STRING = "height"
	href_kw: STRING = "href"
	html_equiv_kw: STRING = "html-equiv"
	id_kw: STRING = "id"
	itemscope_kw: STRING = "itemscope"
	itemtype_kw: STRING = "itemtype"
	lang_kw: STRING = "lang"
	maxlength_kw: STRING = "maxlength"
	method_kw: STRING = "method"
	name_kw: STRING = "name"
	onabort_kw: STRING = "onabort"
	onafterprint_kw: STRING = "onafterprint"
	onbeforeprint_kw: STRING = "onbeforeprint"
	onbeforeunload_kw: STRING = "onbeforeunload"
	onblur_kw: STRING = "onblur"
	oncanplay_kw: STRING = "oncanplay"
	oncanplaythrough_kw: STRING = "oncanplaythrough"
	onchange_kw: STRING = "onchange"
	onclick_kw: STRING = "onclick"
	oncontextmenu_kw: STRING = "oncontextmenu"
	oncopy_kw: STRING = "oncopy"
	oncuechange_kw: STRING = "oncuechange"
	oncut_kw: STRING = "oncut"
	ondblclick_kw: STRING = "ondblclick"
	ondrag_kw: STRING = "ondrag"
	ondragend_kw: STRING = "ondragend"
	ondragenter_kw: STRING = "ondragenter"
	ondragleave_kw: STRING = "ondragleave"
	ondragover_kw: STRING = "ondragover"
	ondragstart_kw: STRING = "ondragstart"
	ondrop_kw: STRING = "ondrop"
	ondurationchange_kw: STRING = "ondurationchange"
	onemptied_kw: STRING = "onemptied"
	onended_kw: STRING = "onended"
	onerror_kw: STRING = "onerror"
	onfocus_kw: STRING = "onfocus"
	onhashchange_kw: STRING = "onhashchange"
	oninput_kw: STRING = "oninput"
	oninvalid_kw: STRING = "oninvalid"
	onkeydown_kw: STRING = "onkeydown"
	onkeypress_kw: STRING = "onkeypress"
	onkeyup_kw: STRING = "onkeyup"
	onload_kw: STRING = "onload"
	onloadeddata_kw: STRING = "onloadeddata"
	onloadedmetadata_kw: STRING = "onloadedmetadata"
	onloadstart_kw: STRING = "onloadstart"
	onmessage_kw: STRING = "onmessage"
	onmousedown_kw: STRING = "onmousedown"
	onmousemove_kw: STRING = "onmousemove"
	onmouseout_kw: STRING = "onmouseout"
	onmouseover_kw: STRING = "onmouseover"
	onmouseup_kw: STRING = "onmouseup"
	onmousewheel_kw: STRING = "onmousewheel"
	onoffline_kw: STRING = "onoffline"
	ononline_kw: STRING = "ononline"
	onpagehide_kw: STRING = "onpagehide"
	onpageshow_kw: STRING = "onpageshow"
	onpaste_kw: STRING = "onpaste"
	onpause_kw: STRING = "onpause"
	onplay_kw: STRING = "onplay"
	onplaying_kw: STRING = "onplaying"
	onpopstate_kw: STRING = "onpopstate"
	onprogress_kw: STRING = "onprogress"
	onratechange_kw: STRING = "onratechange"
	onreset_kw: STRING = "onreset"
	onresize_kw: STRING = "onresize"
	onscroll_kw: STRING = "onscroll"
	onsearch_kw: STRING = "onsearch"
	onseeked_kw: STRING = "onseeked"
	onseeking_kw: STRING = "onseeking"
	onselect_kw: STRING = "onselect"
	onstalled_kw: STRING = "onstalled"
	onstorage_kw: STRING = "onstorage"
	onsubmit_kw: STRING = "onsubmit"
	onsuspend_kw: STRING = "onsuspend"
	ontimeupdate_kw: STRING = "ontimeupdate"
	onunload_kw: STRING = "onunload"
	onvolumechange_kw: STRING = "onvolumechange"
	onwaiting_kw: STRING = "onwaiting"
	onwheel_kw: STRING = "onwheel"
	pattern_kw: STRING = "pattern"
	placeholder_kw: STRING = "placeholder"
	property_kw: STRING = "property"
	rel_kw: STRING = "rel"
	role_kw: STRING = "role"
	rows_kw: STRING = "rows"
	rowspan_kw: STRING = "rowspan"
	size_kw: STRING = "size"
	src_kw: STRING = "src"
	status_kw: STRING = "status"
	style_kw: STRING = "style"
	stylesheet_kw: STRING = "stylesheet"
	target_kw: STRING = "target"
	title_kw: STRING = "title"
	type_kw: STRING = "type"
	valign_kw: STRING = "valign"
	value_kw: STRING = "value"
	width_kw: STRING = "width"
	wrap_kw: STRING = "wrap"
	xml_lang_kw: STRING = "xml:lang"
	xmlns_kw: STRING = "xmlns"

feature -- Magic Number Reducers

	size_equals (a_value: INTEGER): STRING
			-- Size
		do
			Result := a_value.out
		end

	maxlength_equals (a_value: INTEGER): STRING
			-- Max length
		do
			Result := a_value.out
		end

	cols_equals (a_value: INTEGER): STRING
			-- Columns
		do
			Result := a_value.out
		end

	rows_equals (a_value: INTEGER): STRING
			-- Rows
		do
			Result := a_value.out
		end

feature -- Constants

	include_break: BOOLEAN = True
	no_break: BOOLEAN = False

	valid_tags: ARRAYED_LIST [STRING]
			-- `valid_tags' in HTML5.
		once
			create Result.make (200)
			Result.force ("a")
			Result.force ("article")
			Result.force ("aside")
			Result.force ("base")
			Result.force ("body")
			Result.force ("br")
			Result.force ("button")
			Result.force ("caption")
			Result.force ("col")
			Result.force ("colgroup")
			Result.force ("dd")
			Result.force ("div")
			Result.force ("dl")
			Result.force ("fieldset")
			Result.force ("figure")
			Result.force ("footer")
			Result.force ("form")
			Result.force ("h1")
			Result.force ("h2")
			Result.force ("h3")
			Result.force ("h4")
			Result.force ("h5")
			Result.force ("h6")
			Result.force ("head")
			Result.force ("img")
			Result.force ("input")
			Result.force ("label")
			Result.force ("li")
			Result.force ("link")
			Result.force ("mark")
			Result.force ("menu")
			Result.force ("meta")
			Result.force ("nav")
			Result.force ("ol")
			Result.force ("optgroup")
			Result.force ("option")
			Result.force ("p")
			Result.force ("page")
			Result.force ("script")
			Result.force ("section")
			Result.force ("select")
			Result.force ("small")
			Result.force ("style")
			Result.force ("table")
			Result.force ("tbody")
			Result.force ("td")
			Result.force ("textarea")
			Result.force ("tfoot")
			Result.force ("th")
			Result.force ("thead")
			Result.force ("title")
			Result.force ("tr")
			Result.force ("ul")
		end

	percent (a_value: INTEGER): STRING
		do
			Result := a_value.out + ('%%').out
		end

end
