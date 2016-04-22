note
	description: "[
		Representation of an {HTML_COLGROUP}.
		]"

class
	HTML_COLGROUP

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_COLGROUP}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "colgroup"
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

		The <colgroup> tag specifies a group of one or more columns in a table for formatting.

		The <colgroup> tag is useful for applying styles to entire columns, instead of repeating
		the styles for each cell, for each row.

		Note: The <colgroup> tag must be a child of a <table> element, after any <caption> elements
		and before any <thead>, <tbody>, <tfoot>, and <tr> elements.

		Tip: To define different properties to a column within a <colgroup>, use the <col> tag
		within the <colgroup> tag.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_colgroup.asp"

end
