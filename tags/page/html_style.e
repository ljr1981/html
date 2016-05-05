note
	description: "[
		Representation of an {HTML_STYLE}.
		]"

class
	HTML_STYLE

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "style"
			-- <Precursor>

;note
	design: "[
Tag    Description
<style>    Defines style information for a document
		]"
	EIS: "name=style", "src=http://www.w3schools.com/tags/tag_style.asp"

end
