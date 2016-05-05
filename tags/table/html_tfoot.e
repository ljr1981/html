note
	description: "[
		Representation of an {HTML_TFOOT}.
		]"

class
	HTML_TFOOT

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "tfoot"
			-- <Precursor>

;note
	design: "[
		<table>
		  <thead>
		    <tr>
		      <th>Month</th>
		      <th>Savings</th>
		    </tr>
		  </thead>
		  <tfoot>
		    <tr>
		      <td>Sum</td>
		      <td>$180</td>
		    </tr>
		  </tfoot>
		  <tbody>
		    <tr>
		      <td>January</td>
		      <td>$100</td>
		    </tr>
		    <tr>
		      <td>February</td>
		      <td>$80</td>
		    </tr>
		  </tbody>
		</table>

		The <tfoot> tag is used to group footer content in an HTML table.

		The <tfoot> element is used in conjunction with the <thead> and <tbody>
		elements to specify each part of a table (footer, header, body).

		Browsers can use these elements to enable scrolling of the table body
		independently of the header and footer. Also, when printing a large table
		that spans multiple pages, these elements can enable the table header and
		footer to be printed at the top and bottom of each page.

		The <tfoot> tag must be used in the following context: As a child of a <table>
		element, after any <caption>, <colgroup>, and <thead> elements and before
		any <tbody> and <tr> elements.

		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_tfoot.asp"

end
