note
	description: "[
		Representation of an {HTML_FOOTER}.
		]"

class
	HTML_FOOTER

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "footer"
			-- <Precursor>

;note
	design: "[
Tag    Description
<footer>    Defines a footer for a document or section
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_footer.asp"

end
