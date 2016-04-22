note
	description: "[
		Representation of an {HTML_CAPTION}.
		]"

class
	HTML_CAPTION

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_CAPTION}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "caption"
			-- <Precursor>

;note
	design: "[
		<table>
		  <caption>Monthly savings</caption>
		  <tr>
		    <th>Month</th>
		    <th>Savings</th>
		  </tr>
		  <tr>
		    <td>January</td>
		    <td>$100</td>
		  </tr>
		</table>

		The <caption> tag defines a table caption.

		The <caption> tag must be inserted immediately after the <table> tag.

		Note: You can specify only one caption per table.

		Tip: By default, a table caption will be center-aligned above a table.
		However, the CSS properties text-align and caption-side can be used to
		align and place the caption.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_caption.asp"

end
