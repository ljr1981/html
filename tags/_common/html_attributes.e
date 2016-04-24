note
	description: "[
		Representation of common {HTML_ATTRIBUTES}.
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

feature {NONE} -- Common Attributes

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
