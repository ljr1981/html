note
	description: "[
		Representation of an {HTML_LINK}.
		]"

class
	HTML_LINK

inherit
	HTML_TAG
		export {ANY}
			crossorigin, set_crossorigin,
			href, set_href,
			hreflang, set_hreflang,
			media, set_media,
			rel, set_rel,
			sizes, set_sizes,
			type, set_type
		end

create
	default_create,
	make_with_content,
	make_as_css_file_link

feature {NONE} -- Initialization

	make_as_css_file_link (a_css_file_name: STRING)
			-- `make_as_css_file_link' with `a_css_file_name'
			-- Sets rel="stylesheet" and type="text/css" as well.
		do
			default_create
			set_rel ("stylesheet")
			set_type ("text/css")
			set_href (a_css_file_name)
		end

feature -- Setters

	set_as_css_file_link (a_css_file_name: STRING)
		do
			set_rel ("stylesheet")
			set_type ("text/css")
			set_href (a_css_file_name)
		end

feature -- Output

	tag_name: STRING = "link"
			-- <Precursor>

;note
	design: "[
Tag    Description
<link>    Defines the relationship between a document and an external resource
		]"
	EIS: "name=link", "src=http://www.w3schools.com/tags/tag_link.asp"

end
