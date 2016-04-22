note
	description: "[
		Representation of an {HTML_TBODY}.
		]"

class
	HTML_TBODY

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_TBODY}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "tbody"
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
		
		The <tbody> tag is used to group the body content in an HTML table.

		The <tbody> element is used in conjunction with the <thead> and <tfoot>
		elements to specify each part of a table (body, header, footer).

		Browsers can use these elements to enable scrolling of the table body
		independently of the header and footer. Also, when printing a large table
		that spans multiple pages, these elements can enable the table header and
		footer to be printed at the top and bottom of each page.

		The <tbody> tag must be used in the following context: As a child of a
		<table> element, after any <caption>, <colgroup>, and <thead> elements.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_tbody.asp"

end
