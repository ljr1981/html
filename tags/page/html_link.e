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
	make_as_css_file_link,
	make_with_rel_type_href

feature {NONE} -- Initialization

	make_with_rel_type_href (a_rel, a_type, a_href: STRING)
		do
			set_rel (a_rel)
			set_type (a_type)
			set_href (a_href)
		end

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

	set_as_rel_type_href (a_rel, a_type, a_href: STRING): HTML_LINK
		do
			set_rel (a_rel)
			set_type (a_type)
			set_href (a_href)
			Result := Current
		end
	set_as_css_file_link (a_css_file_name: STRING)
		do
			set_rel ("stylesheet")
			set_type ("text/css")
			set_href (a_css_file_name)
		end

	set_as_cdn_stylesheet (a_href, a_integrity, a_crossorigin: STRING)
		do
			set_rel ("stylesheet")
			set_href (a_href)
			set_attribute_manual ("integrity", a_integrity, True)
			set_crossorigin (a_crossorigin)
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
