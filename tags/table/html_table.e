note
	description: "[
		Representation of an {HTML_TABLE}.
		]"

class
	HTML_TABLE

inherit
	HTML_TAG
		redefine
			attribute_list
		end

create
	default_create,
	make_with_content

feature -- HTML Attributes

	table_border: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_table_border.asp"
		attribute Result := ["0", "0", Void, "border", is_quoted] end

	attribute_list: HASH_TABLE [attached like attribute_tuple_anchor, STRING]
			-- <Precursor>
			-- HTML attributes for <table>
		do
			Result := Precursor
			Result.force (table_border, "border")
		ensure then
			count: Result.count >= 4
		end

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_TABLE}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "table"
			-- <Precursor>

;note
	design: "[
		<table>
		  <tr>
		    <th>Month</th>
		    <th>Savings</th>
		  </tr>
		  <tr>
		    <td>January</td>
		    <td>$100</td>
		  </tr>
		</table>
		
		The <table> tag defines an HTML table.

		An HTML table consists of the <table> element and one or
		more <tr>, <th>, and <td> elements.

		The <tr> element defines a table row, the <th> element defines
		a table header, and the <td> element defines a table cell.

		A more complex HTML table may also include <caption>, <col>,
		<colgroup>, <thead>, <tfoot>, and <tbody> elements.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_table.asp"

end
