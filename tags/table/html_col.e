note
	description: "[
		Representation of an {HTML_COL}.
		]"

class
	HTML_COL

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "col"
			-- <Precursor>

;note
	design: "[
		<table>
		  <colgroup>
		    <col span="2" style="background-color:red">
		    <col style="background-color:yellow">
		  </colgroup>
		  <tr>
		    <th>ISBN</th>
		    <th>Title</th>
		    <th>Price</th>
		  </tr>
		  <tr>
		    <td>3476896</td>
		    <td>My first HTML</td>
		    <td>$53</td>
		  </tr>
		</table>

		The <col> tag specifies column properties for each column within a <colgroup> element.

		The <col> tag is useful for applying styles to entire columns,
		instead of repeating the styles for each cell, for each row.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_col.asp"

end
