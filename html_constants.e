note
	description: "[
		Representation of {HTML_CONSTANTS}.
		]"

class
	HTML_CONSTANTS

feature -- Magic Number Reducers

	size_equals (a_value: INTEGER): STRING
			-- Size
		do
			Result := a_value.out
		end

	maxlength_equals (a_value: INTEGER): STRING
			-- Max length
		do
			Result := a_value.out
		end

	cols_equals (a_value: INTEGER): STRING
			-- Columns
		do
			Result := a_value.out
		end

	rows_equals (a_value: INTEGER): STRING
			-- Rows
		do
			Result := a_value.out
		end

feature -- Constants

	include_break: BOOLEAN = True
	no_break: BOOLEAN = False

	valid_tags: ARRAYED_LIST [STRING]
			-- `valid_tags' in HTML5.
		once
			create Result.make (200)
			Result.force ("a")
			Result.force ("article")
			Result.force ("aside")
			Result.force ("base")
			Result.force ("body")
			Result.force ("br")
			Result.force ("button")
			Result.force ("caption")
			Result.force ("col")
			Result.force ("colgroup")
			Result.force ("dd")
			Result.force ("div")
			Result.force ("dl")
			Result.force ("fieldset")
			Result.force ("figure")
			Result.force ("footer")
			Result.force ("form")
			Result.force ("h1")
			Result.force ("h2")
			Result.force ("h3")
			Result.force ("h4")
			Result.force ("h5")
			Result.force ("h6")
			Result.force ("head")
			Result.force ("img")
			Result.force ("input")
			Result.force ("label")
			Result.force ("li")
			Result.force ("link")
			Result.force ("menu")
			Result.force ("meta")
			Result.force ("nav")
			Result.force ("ol")
			Result.force ("optgroup")
			Result.force ("option")
			Result.force ("p")
			Result.force ("page")
			Result.force ("script")
			Result.force ("section")
			Result.force ("select")
			Result.force ("style")
			Result.force ("table")
			Result.force ("tbody")
			Result.force ("td")
			Result.force ("textarea")
			Result.force ("tfoot")
			Result.force ("th")
			Result.force ("thead")
			Result.force ("title")
			Result.force ("tr")
			Result.force ("ul")
		end

end
