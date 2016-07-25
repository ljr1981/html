note
	description: "[
		Representation of an {HTML_HEAD}.
		]"

class
	HTML_HEAD

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "head"
			-- <Precursor>

;note
	design: "[
Tag    Description
<head>    Defines information about the document
		]"
	EIS: "name=head", "src=http://www.w3schools.com/tags/tag_head.asp"

end
