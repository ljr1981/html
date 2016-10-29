note
	description: "[
		Representation of an {HTML_META}.
		]"

class
	HTML_META

inherit
	HTML_TAG
		export {ANY}
			charset, set_charset,
			content, set_content,
			html_equiv, set_html_equiv,
			property, set_property,
			name, set_name
		redefine
			default_create
		end

create
	default_create,
	make_with_content

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			exclude_end_tag := True
			Precursor
		end

feature -- Output

	tag_name: STRING = "meta"
			-- <Precursor>

;note
	design: "[
Tag    Description
<meta>    Defines metadata about an HTML document
		]"
	EIS: "name=meta", "src=http://www.w3schools.com/tags/tag_meta.asp"

end
