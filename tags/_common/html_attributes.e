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

	border_attribute: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_table_border.asp"
		attribute Result := ["0", "0", Void, "border", is_quoted] end

	href_attribute: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_a_href.asp"
		attribute Result := ["", "", Void, "href", is_quoted] end

	role: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3cshools.com"
		attribute Result := ["", "", Void, "role", is_quoted] end

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
			Result.force (border_attribute, border_attribute.attr_name)
			Result.force (href_attribute, href_attribute.attr_name)
			Result.force (role, role.attr_name)

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
		ensure then
			count: Result.count >= Default_capacity
		end

feature -- Constants

	Default_capacity: INTEGER
		once ("object") Result := 6 end

	attribute_separator: STRING = "  "

end
