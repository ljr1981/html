note
	description: "[
		Representation of an {HTML_PAGE}.
		]"
	design: "[
		See class notes at the end of the class.
		]"

class
	HTML_PAGE

inherit
	HTML_TAG
		export {NONE}
			html_content_items,
			status, set_status,
			lang, set_lang,
			xml_lang, set_xml_lang,
			xmlns, set_xmlns
		redefine
			html_out,
			pretty_out,
			make_with_content,
			add_content
		end

create
	default_create,
	make_with_content

feature {NONE} -- Initialization

	make_with_content (a_content: ARRAY [attached like content_anchor])
			-- <Precursor>
		do
			check has_body: attached (create {HTML_BODY}.make_with_content (a_content)) as al_body then
				internal_body := al_body
			end
		end

feature -- Output

	html_out: STRING
			-- <Precursor>
			-- Add notion of `doctype' and other "<head>" items.
		do
			Result := doctype.twin
			Result.append_string (start_tag)

				-- Tag attributes ...
			if attached attributes_out as al_attributes_out and then not al_attributes_out.is_empty then
				Result.replace_substring_all (tag_attributes_tag, " " + al_attributes_out)
			else
				Result.replace_substring_all (tag_attributes_tag, create {STRING}.make_empty)
			end

			if attached internal_head as al_head then Result.append_string (al_head.html_out) end
			if attached internal_body as al_body then Result.append_string (al_body.html_out) end

			Result.append_string (end_tag)
		end

	pretty_out: STRING
			-- <Precursor>
			-- Add notion of `doctype' and other "<head>" items.
		do
			Result := doctype.twin
			Result.append_string (start_tag)
			Result.append_character ('%N'); Result.append_character ('%T')

				-- Tag attributes ...
			if attached attributes_out as al_attributes_out and then not al_attributes_out.is_empty then
				Result.replace_substring_all (tag_attributes_tag, " " + al_attributes_out)
			else
				Result.replace_substring_all (tag_attributes_tag, create {STRING}.make_empty)
			end

			if attached internal_head as al_head then Result.append_string (al_head.pretty_out) end
			Result.append_character ('%N'); Result.append_character ('%T')
			if attached internal_body as al_body then Result.append_string (al_body.pretty_out) end
			Result.append_character ('%N'); Result.append_character ('%T')

			Result.append_string (end_tag)
			Result.append_character ('%N'); Result.append_character ('%T')
		end

	tag_name: STRING = "html"
			-- <Precursor>

feature -- Access

	head: attached like internal_head
		do
			check attached internal_head as al_head then Result := al_head end
		end

	body: attached like internal_body
		do
			check attached internal_body as al_body then Result := al_body end
		end

feature -- Adders

	add_css_link (a_href: STRING)
		local
			l_link: HTML_LINK
		do
			create l_link.make_as_css_file_link (a_href)
			head.add_content (l_link)
		end

	add_javascript_script (a_src: STRING)
		local
			l_script: HTML_SCRIPT
		do
			create l_script.make_with_javascript_file_name (a_src)
			head.add_content (l_script)
		end

	add_meta (a_name, a_content: STRING)
			-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		local
			l_meta: HTML_META
		do
			create l_meta
			l_meta.set_name (a_name)
			l_meta.set_content (a_content)
			head.add_content (l_meta)
		end

feature -- Settings

	add_content (a_item: attached like content_anchor)
			-- `add_content' `a_item' to `html_content_items'
		do
			if attached internal_body as al_body then
				al_body.add_content (a_item)
			else
				create internal_body.make_with_content (<<a_item>>)
			end
		ensure then
			has_content: attached internal_body
		end

	set_head (a_head: like internal_head)
			-- `set_head' with `a_head' into `internal_head'.
		do
			internal_head := a_head
		ensure
			set: internal_head ~ a_head
		end

	set_body (a_body: like internal_body)
			-- `set_body' with `a_body' into `internal_body'.
		do
			internal_body := a_body
		ensure
			set: internal_body ~ a_body
		end

feature {NONE} -- Implementation

	doctype: STRING = "<!DOCTYPE html>" -- "<!DOCTYPE html PUBLIC %"-//W3C//DTD XHTML 1.0 Strict//EN%" %"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd%">"
			-- `doctype' for HTML-5 (not 4.x or XML or other).
			-- This may (later on) need to be a class.

	internal_head: detachable HTML_HEAD
			-- `internal_head' of Current {HTML_PAGE}.

	internal_body: detachable HTML_BODY
			-- `internal_body' of Current {HTML_PAGE}.

invariant
	no_content: html_content_items.count = 0

;note
	design: "[
Tag    Description
<head>    Defines information about the document
<title>    Defines the title of a document
<base>    Defines a default address or a default target for all links on a page
<link>    Defines the relationship between a document and an external resource
<meta>    Defines metadata about an HTML document
<script>    Defines a client-side script
<style>    Defines style information for a document
		]"
	EIS: "name=doctype", "src=http://www.w3schools.com/tags/tag_doctype.asp"
	EIS: "name=head", "src=http://www.w3schools.com/tags/tag_head.asp"
	EIS: "name=title", "src=http://www.w3schools.com/tags/tag_title.asp"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_base.asp"
	EIS: "name=link", "src=http://www.w3schools.com/tags/tag_link.asp"
	EIS: "name=meta", "src=http://www.w3schools.com/tags/tag_meta.asp"
	EIS: "name=script", "src=http://www.w3schools.com/tags/tag_script.asp"
	EIS: "name=style", "src=http://www.w3schools.com/tags/tag_style.asp"

end
