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

feature -- Attribute List

	attribute_list: HASH_TABLE [attached like attribute_tuple_anchor, STRING]
			-- <Precursor>
			-- HTML attributes for <table>
		do
				-- Global
			create Result.make (Default_capacity)
			Result.force (global_accesskey, "accesskey")
			Result.force (global_class, "class")
			Result.force (global_id, "id")
			Result.force (global_style, "style")

				-- Common
			Result.force (border_attribute, "border")
			Result.force (href_attribute, href_attribute.attr_name)

		ensure then
			count: Result.count >= Default_capacity
		end

feature -- Constants

	Default_capacity: INTEGER
		once ("object") Result := 6 end

	attribute_separator: STRING = "  "

end
