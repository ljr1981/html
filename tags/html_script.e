note
	description: "[
		Representation of an {HTML_SCRIPT}.
		]"

class
	HTML_SCRIPT

inherit
	HTML_ANY

	HTML_TAG
		undefine
			default_create,
			out
		end

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_SCRIPT}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "script"
			-- <Precursor>

;note
	design: "[
Tag    Description
<script>    Defines a client-side script
		]"
	EIS: "name=script", "src=http://www.w3schools.com/tags/tag_script.asp"

end
