note
	description: "[
		Representation of an {HTML_SCRIPT}.
		]"

class
	HTML_SCRIPT

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "script"
			-- <Precursor>

;note
	design: "[
Tag    Description
<script>    Defines a client-side script
		]"
	EIS: "name=script", "src=http://www.w3schools.com/tags/tag_script.asp"

end
