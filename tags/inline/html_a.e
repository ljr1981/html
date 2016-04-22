note
	description: "[
		Representation of an {HTML_A}.
		]"

class
	HTML_A

inherit
	HTML_TAG
		redefine
			attribute_list
		end

create
	default_create,
	make_with_content

feature -- Attributes

	href: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_a_href.asp"
		attribute Result := ["", "", Void, "href", is_quoted] end

	attribute_list: HASH_TABLE [attached like attribute_tuple_anchor, STRING]
			-- <Precursor>
			-- HTML attributes for <table>
		do
			Result := Precursor
			Result.force (href, href.attr_name)
		ensure then
			count: Result.count >= Default_capacity
		end

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_A}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "a"
			-- <Precursor>

;note
	design: "[
Tag    Description
<a>    Defines a hyperlink, which is used to link from one page to another
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_a.asp"

end
