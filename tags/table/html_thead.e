note
	description: "[
		Representation of an {HTML_THEAD}.
		]"

class
	HTML_THEAD

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_THEAD}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "thead"
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

		The <thead> tag is used to group header content in an HTML table.

		The <thead> element is used in conjunction with the <tbody> and <tfoot> elements
		to specify each part of a table (header, body, footer).

		Browsers can use these elements to enable scrolling of the table body independently
		of the header and footer. Also, when printing a large table that spans multiple pages,
		these elements can enable the table header and footer to be printed at the top and bottom
		of each page.

		The <thead> tag must be used in the following context: As a child of a <table> element,
		after any <caption>, and <colgroup> elements, and before any <tbody>, <tfoot>, and <tr>
		elements.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_thead.asp"

end
