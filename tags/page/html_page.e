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
			make_with_content
		end

create
	default_create,
	make_with_content

feature {NONE} -- Initialization

	make_with_content (a_content: ARRAY [attached like content_anchor])
			-- <Precursor>
		do
			body.add_contents (a_content)
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

			Result.append_string (head.html_out)
			Result.append_string (body.html_out)

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

			Result.append_string (head.pretty_out)
			Result.append_character ('%N'); Result.append_character ('%T')
			Result.append_string (body.pretty_out)
			Result.append_character ('%N'); Result.append_character ('%T')

			Result.append_string (end_tag)
			Result.append_character ('%N'); Result.append_character ('%T')
		end

	tag_name: STRING = "html"
			-- <Precursor>

feature -- Access

	head: like new_head
		attribute
			Result := new_head
		end

	body: like new_body
		attribute
			Result := new_body
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

feature {NONE} -- Implementation

	doctype: STRING = "<!DOCTYPE html>" -- "<!DOCTYPE html PUBLIC %"-//W3C//DTD XHTML 1.0 Strict//EN%" %"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd%">"
			-- `doctype' for HTML-5 (not 4.x or XML or other).
			-- This may (later on) need to be a class.

--	internal_head: detachable HTML_HEAD
--			-- `internal_head' of Current {HTML_PAGE}.

--	internal_body: detachable HTML_BODY
--			-- `internal_body' of Current {HTML_PAGE}.

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
